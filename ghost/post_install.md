# Ghost

This ghost blog using sqlite as the database backend.

## External Access

An Ingress is created during the installation process. To access your ghost use `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com`

## Create Admin User

By default Ghost does not create Admin user during the installation process. In order to access your Ghost Dashboard you will need to create your Ghost Admin user first. This can be done right after your installation process via your browser.

To access your Ghost registration page simply access your Ghost installation via your browser using the following URL: `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com`, after that follow step below :

* Click `Create your account` button.  
* Input your site title, username, email address and desired password ( at least 10 characters ).  
* Invite your friend to Collaborate on your blog. This is optional, If you don't want to invite others just click text `I'll do this later, take me to my site!`.

## Delete default user created by ghost

By default ghost create user name `Ghost` and create example post in your blog. You can follow this step to delete it.

* Login to your ghost admin url `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com/ghost`.  
* Click the `Staff` menu in the left column.  
* In the righ column, click the user name `Ghost`.  
* Click the option button in the upper right ( in the left of save button ).  
* Chose `Delete button`

## How to create your first blog post

Follow this step to create your first blog post :

* To begin your first blog post login to ghost admin url `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com/ghost`.  
* Inside the ghost admin menu, click `Posts` menu at the left column. Click `New post` button in the upper right.  
* Write your blog.  
* If you want to publish your blog, click the `publish` button in the upper right. If you want to publish it later, Click the `< Posts` button in the upper left, your article should be automaticaly saved as draft.

## Modify URL

If you want to change the url edit with 

```
kubectl -n ghost edit ingress ghost-blog
```

After that run deployment patch to update the url env in ghost.

First Create file `patch.yaml` using template below :

```yaml
spec:
  template:
    spec:
      containers:
      - name: ghost-blog
        env:
        - name: url
          value: CHANGE_WITH_YOUR_NEW_URL
```

Run the patch command

```
kubectl -n ghost patch deployment ghost-blog --patch "$(cat patch.yaml)"
```


