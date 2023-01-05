from os.path import join


def upload_to(instance, filename):
    extention= filename.split(".")[-1]
    imgName= getattr(instance, 'name', f'{instance.pk}')
    newName= f"{imgName}.{extention}"    
    return join(f"images/{instance.__class__.__name__}/", newName)


def uploadSVG_to(instance, filename):
    extention= filename.split(".")[-1]
    imgName= getattr(instance, 'name', f'{instance.pk}')
    newName= f"{imgName}.{extention}"    
    return join(f"svg/{instance.__class__.__name__}/", newName)
