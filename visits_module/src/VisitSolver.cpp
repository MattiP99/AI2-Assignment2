    /*
     <one line to give the program's name and a brief idea of what it does.>
     Copyright (C) 2015  <copyright holder> <email>
     
     This program is free software: you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation, either version 3 of the License, or
     (at your option) any later version.
     
     This program is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
     
     You should have received a copy of the GNU General Public License
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
     */


#include "VisitSolver.h"
#include "ExternalSolver.h"
#include <map>
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <initializer_list>
#include "armadillo"


using namespace std;
using namespace arma;
double results = 0;




    //map <string, vector<double> > region_mapping;

extern "C" ExternalSolver* create_object(){
  return new VisitSolver();
}

extern "C" void destroy_object(ExternalSolver *externalSolver){
  delete externalSolver;
}

VisitSolver::VisitSolver(){

}

VisitSolver::~VisitSolver(){

}

void VisitSolver::loadSolver(string *parameters, int n){
  starting_position = "r0";
  string Paramers = parameters[0];

  char const *x[]={"distance"};
  char const *y[]={"act-cost","triggered"};
  parseParameters(Paramers);
  affected = list<string>(x,x+1);
  dependencies = list<string>(y,y+2);

  string waypoint_file = "visits_domain/waypoint.txt";   // change this to the correct path
  parseWaypoint(waypoint_file);

  string landmark_file = "visits_domain/landmark.txt";  // change this to the correct path
  parseLandmark(landmark_file);


        //startEKF();
}

map<string,double> VisitSolver::callExternalSolver(map<string,double> initialState,bool isHeuristic){

  map<string, double> toReturn;
  map<string, double>::iterator iSIt = initialState.begin();
  map<string, double>::iterator isEnd = initialState.end();
  double distance;
  double act_cost;

  
  


  map<string, double> trigger;

  for(;iSIt!=isEnd;++iSIt){

    string parameter = iSIt->first;
    string function = iSIt->first;
    double value = iSIt->second;

    function.erase(0,1);
    function.erase(function.length()-1,function.length());
    int n=function.find(" ");

    if(n!=-1){
      string arg=function;
      string tmp = function.substr(n+1,5);

      function.erase(n,function.length()-1);
      arg.erase(0,n+1);
      if(function=="triggered"){
        trigger[arg] = value>0?1:0;
        if (value>0){

           string from = tmp.substr(0,2);   // from and to are regions, need to extract wps (poses)
           string to = tmp.substr(3,2);

	cout << "from " << from <<endl;
	cout << "to " << to << endl;
           distance_euc(from, to);
	   results = calculateExtern(distance, act_cost);
       }
     }
   }else{
     if(function=="distance"){
         distance = results;

     } else if(function=="act-cost"){
         act_cost = results;
          } //else if(function=="dummy1"){
                    //duy = value;              
                    ////cout << parameter << " " << value << endl;
                 //}
      }
    }


   
   if (ExternalSolver::verbose){
        cout << "(distance) " << results << endl;
       }

    toReturn["(distance)"] = results;


        return toReturn;
            }

        list<string> VisitSolver::getParameters(){

        return affected;
          }

        list<string> VisitSolver::getDependencies(){

         return dependencies;
}


void VisitSolver::parseParameters(string parameters){

              int curr, next;
              string line;
              ifstream parametersFile(parameters.c_str());
              if (parametersFile.is_open()){
                while (getline(parametersFile,line)){
                 curr=line.find(" ");
                 string region_name = line.substr(0,curr).c_str();
                 curr=curr+1;
                 while(true ){
                  next=line.find(" ",curr);
                  region_mapping[region_name].push_back(line.substr(curr,next-curr).c_str());
                  if (next ==-1)
                   break;
                 curr=next+1;

               }                
             }

           }

         }

         double VisitSolver::calculateExtern(double distance, double total_cost){
       //float random1 = static_cast <float> (rand())/static_cast <float>(RAND_MAX);
       double cost = cost_dist ;
      
       return cost;
     }

     void VisitSolver::parseWaypoint(string waypoint_file){

       int curr, next;
       string line;
       double pose1, pose2, pose3;
       ifstream parametersFile(waypoint_file);
       if (parametersFile.is_open()){
        while (getline(parametersFile,line)){
         curr=line.find("[");
         string waypoint_name = line.substr(0,curr).c_str();

         curr=curr+1;
         next=line.find(",",curr);

         pose1 = (double)atof(line.substr(curr,next-curr).c_str());
         curr=next+1; next=line.find(",",curr);

         pose2 = (double)atof(line.substr(curr,next-curr).c_str());
         curr=next+1; next=line.find("]",curr);

         pose3 = (double)atof(line.substr(curr,next-curr).c_str());

         waypoint[waypoint_name] = vector<double> {pose1, pose2, pose3};
       }
     }

   }

   void VisitSolver::parseLandmark(string landmark_file){

     int curr, next;
     string line;
     double pose1, pose2, pose3;
     ifstream parametersFile(landmark_file);
     if (parametersFile.is_open()){
      while (getline(parametersFile,line)){
       curr=line.find("[");
       string landmark_name = line.substr(0,curr).c_str();
       
       curr=curr+1;
       next=line.find(",",curr);

       pose1 = (double)atof(line.substr(curr,next-curr).c_str());
       curr=next+1; next=line.find(",",curr);

       pose2 = (double)atof(line.substr(curr,next-curr).c_str());
       curr=next+1; next=line.find("]",curr);

       pose3 = (double)atof(line.substr(curr,next-curr).c_str());

       landmark[landmark_name] = vector<double> {pose1, pose2, pose3};
     }
   }
   
 }


double distance(arma::vec from, arma::vec to){
cout << "to(x) " << to(0) << endl;
cout << "to(y) " << to(1) << endl;
cout << "from(x) " << from(0) << endl;
cout << "from(y) " << from(1) << endl;

	return sqrt(pow(to(0) - from(0),2) + pow(to(1) - from(1),2));
}
 
void VisitSolver::distance_euc(string from, string to){
	
	// Note: from and to are the string name of the room like r0,r1 etc...
	string ws_, wg_;
        double tmp_dist = datum::inf;


	if (!region_mapping.count(from))  {throw invalid_argument(string("'from' region "+ from +" not found")); }
        if (!region_mapping.count(to))  {throw invalid_argument(string("'to' region "+ to +" not found")); }   
  	for (string ws : region_mapping[from])
  	{
  	  	for (string wg : region_mapping[to])
    		{
     			 if (!waypoint.count(ws))  {throw invalid_argument(string("'from' waypoint "+ ws +" not found")); }
     			 if (!waypoint.count(wg))  {throw invalid_argument(string("'to' waypoint "+ wg +" not found")); }   

     			  tmp_dist = distance(arma::conv_to<vec>::from(waypoint[ws]), arma::conv_to<vec>::from(waypoint[wg]));
				ws_ = ws;
        		        wg_ = wg;

			break;
    		}
	break;
  	}
  	if (ExternalSolver::verbose)
  	{
    		std::cout << endl << "(ws) " << ws_ << "; (wg) " << wg_ << " : " << tmp_dist << endl;
  	}
    cost_dist = tmp_dist;
  } 







