function [data,iris_image] = imageacquisition()

%Note: comments = NOT NEEDED FOR NOW. USING DUMMIES
%clear rpi
%clear cam
%rpi = raspi();
%cam = cameraboard(rpi, 'Resolution', '800x600');
    
%%%
%NEXT STEP JUST IMREAD
%% process
% delete table;
% add table;
% add data;
% get data;

clear conn

%% Make connection to database
conn = database('mysql','cbsgaba','@Cbsgaba123');
database_name = 'iris_images';
table_name = 'iris_images';
pre_name = 'image';

drop_table = strcat("DROP TABLE IF EXISTS ", table_name);
execute(conn,drop_table);
create_table = ["CREATE TABLE "+table_name+ ...
    "(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(20), images longblob NOT NULL)"];
execute(conn,create_table);

db_path = '/var/lib/mysql-files/';
d = dir(fullfile(db_path,'*.bmp'));
total_images = numel(d)

for i=1:total_images
add_image = ["INSERT INTO "+table_name+"(name,images) " + ...
    "VALUES('"+pre_name + i + "',load_file('"+ fullfile(db_path) + i + ".bmp'))"];
execute(conn,add_image)
end
% query = ["SELECT * FROM iris_images.iris_images"];
% data = fetch(conn,query);

get_image = strcat("SELECT * FROM ",table_name);
data = fetch(conn,get_image);
% image = data.images(1,1);
% parsebinary(image,'BMP')
% image(iris_image)

close(conn)
end