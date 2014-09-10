bloghouse
=========

Starting Up
-----------

To start new project with bloghouse follow these steps

    bash <(curl -fsSL https://raw.github.com/xa0s/bloghouse/master/init.sh) <project>
    cd <project>/engine
    nanoc
    
This will create new project directory with the following structure

* content – sample blog/site content, replace it with yours
* design – sample design, replace it with yours
* engine – engine, bases on nanoc
* g11n – globally usefull localization files
* site – generated blog/site can be found here

