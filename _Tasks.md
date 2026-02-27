# tasks

- Customer details model, were id, name, order history, points, etc. can be stored.
- Member_app needs to connect with backend

- Yes, lets do a backend clean up, etc. Plus maybe it's time do a massive code cleanup, in all project.. I'm sure it is more "left over". We just have to be careful, so we don't remove anything needed, etc.

- Delete the AI assistant component. we will add that again at a later time. So everything regarding that should be deleted.

---

I find that some dish items images has uniq image name in the url (image adress) when I look in browser console:
- ikan_bakar_gurami_badan_MGQQ27T.png
- ayam_kampung_bakar_5JrUkQ3.png
were it should be: 
- ayam_kampung_bakar.png
- ikan_bakar_gurami_badan.png

I suspect that it's when I add images in Django admin panel, it makes a unique name, etc.
See if you can find solution for that.
Because later, when user add stuff like new dish, etc. I need the image upload to work, and the images ends up in right folder in minio storage, etc.

---