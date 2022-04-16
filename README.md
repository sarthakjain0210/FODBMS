# FODBMS
End Term Project

*WIKIPEDIA ARTICLE NETWORKS*

The data was collected from the English Wikipedia (December 2018). 
These datasets represent page-page networks on specific topics (chameleons, crocodiles and squirrels). 
Nodes represent articles and edges are mutual links between them.
The edges csv files contain the edges - nodes are indexed from 0.
The features json files contain the features of articles - each key is a page id, and node features are given as lists.
The presence of a feature in the feature list means that an informative noun appeared in the text of the Wikipedia article.
The target csv contains the node identifiers and the average monthly traffic between October 2017 and November 2018 for each page.
For each page-page network we listed the number of nodes an edges with some other descriptive statistics.

![Dataset Statistics](https://user-images.githubusercontent.com/93217990/163681263-53ec0b06-cf81-4c3e-afee-791ec0e99aa9.jpeg)

Wikipedia Article Networks algorithms used-Fruchterman Reingold, Force Atlas 2, Measures of centrality like betweenness, and modularity was also calculated.

![Preview](https://user-images.githubusercontent.com/93217990/163681457-e3e66a7c-d23e-40a1-8d36-f2cf68198d5b.jpeg)
