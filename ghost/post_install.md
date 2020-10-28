# Ghost

This ghost blog using sqlite as the database backend.

## External Access

An Ingress is created during the installation process. To access your ghost use `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com`

## Create Admin User

By default Ghost does not create Admin user during the installation process. In order to access your Ghost Dashboard you will need to create your Ghost Admin user first. This can be done right after your installation process via your browser.

To access your Ghost registration page simply access your Ghost installation via your browser using the following URL: `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com`

* **Step 1.** Click `Create your account` button.  
* **Step 2.** Input your site title, username, email address and desired password ( at least 10 characters ).  
* **Step 3.** Invite your friend to Collaborate on your blog. This is optional, If you don't want to invite others just click text `I'll do this later, take me to my site!`.  

## How to create your first blog article

* **Step 1.** To begin your first blog article login to ghost admin url `http://ghost.YOUR_CLUSTER_ID.k8s.civo.com/ghost`.  
* **Step 2.** Inside the ghost admin menu, click `Posts` menu at the left column, in the right column should show you example post created by ghost ( you can delete it ). Click `New post` button in the upper right.  
* **Step 3.** Write your article.  
* **Step 4.** If you want to publish your article, click the `publish` button in the upper right.  
Click the `< Posts` button in the upper left to go back to admin menu, if you want to publish it later.

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


