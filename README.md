# WB Pantheon
Docker composer to run Pantheon Drupal sites locally. It may used to run in Cloud ecosystem. System is based on Drupal full stack running under Docker (Alpine Linux, Nginx, MySQL, PHP-FPM) stack.

Composer comes with a small bash script to help you work with remote Drupal sites.  Although the build system are primarily designed to be used on Pantheon, they can also be handy to any remote server that supports git and ssh access.

### Requirements

What you need to run locally on your system:

- A machine running macOS or 11.4 or up or any Linux system with `sudo` privileges
- Latest Docker installed on your machine
- Pantheon Terminus. (You can get from [here](https://docs.pantheon.io/terminus/install))
- Git client and access to the Pantheon

### Installation

You'll need to first obtain the project files from GitHub. Open up your terminal and run the following commands:

```shell
$ git clone git@github.com:picktek/wb-pantheon.git
$ cd wb-pantheon
```

Next, you'll need to add the domain `wb-pantheon.local` to your `/etc/hosts` file. To do so, run the following command:

```shell
$ sudo vi /etc/hosts
```

This will open the hosts file in the `vi` editor. Scroll down to the bottom of the file and add the following line:

```shell
127.0.0.1       wb-pantheon.local
```

Once you've added the domain to the hosts file, save and exit the editor.

Now, you're ready to run the `wbp` script to clone the site. Run the following command:

```shell
$ ./wbp clone
```

You should see the following output:

```
 [notice] Found a machine token for example@example.com.
 [notice] Logged in via machine token.
1) Site Name 1	3) Site Name 3	 5) Site Name 5
2) Site Name 2	4) Site Name 4	 6) Site Name 6
...
Select your site from pantheon (number): 2
```

Select the number corresponding to the site you want to clone and hit Enter. Note that this step may take a while, as the script retrieves and builds the necessary files for your site.

Once the `wbp` script has finished, you should be able to access the site using the following URL:

[http://wb-pantheon.local](http://wb-pantheon.local/)

### Additional Commands

Here are some additional commands that may come in handy:

##### Enter Shell

To enter the Drupal container shell, run the following command:

```shell
./wbp shell
```

This will open up a shell session inside the container. Once you're inside the container, you can use Drush.

##### Run Drush Cache

Once you're inside the container, you can use Drush to rebuild the cache. To do so, simply run the following command:

```shell
drush cache:rebuild
```

This will clear out the cache for your Drupal site.

##### Stop Containers

To stop the running containers, you can use the following command:

```shell
./wbp down
```

This will gracefully shut down the containers and stop any running processes. 

##### Start Containers

To start the containers back up again, you can use the following command:

```shell
./wbp up
```

This will start the containers.

##### Restore DB Dump from file

If you need to restore a database dump from a file, you can use the following command:

```shell
./wbp restore site-dump.sql
```

In this command, `site-dump.sql` is the name of your MySQL dump file. Make sure the file is located in the same directory as the `wbp` script, or provide the full path to the file if it's located elsewhere.

The `restore` command will import the contents of the MySQL dump file into the MySQL container.

### Configuration

By default, the Nginx container is set to run on port `80`. However, if you need to change the port number for any reason, you can do so by modifying the `DEFAULT_WWW_PORT` environment variable in the `wbp` script. Change the `80` to your desired port number, save the file, and then re-run the `wbp` script by invoking command:

```shell
./wbp up
```

You should see the following output:

```
1) Site Name 1
#? 
```

Select the number corresponding to the site you want to re-start. 
