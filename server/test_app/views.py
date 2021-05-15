from django.shortcuts import render
from .models import *
# Create your views here.
from django.http import HttpResponse


def index(request):
    try:
        description = Description.objects.get(id=1)
    except:
        description = Description(text="")

    if request.method == 'POST':
        quillJSON = request.POST.get("quillJSON", "")
        quillHTML = request.POST.get("quillHTML", "")

        quillJSON = quillJSON.replace("&quot", "\"")
        quillHTML = quillHTML.replace("&quot", "\"")

        description.json = quillJSON
        description.html = quillHTML
        description.save()

        context = {"description": description, "success": True}

        return render(request, 'index.html', context)
    else:
        context = {"description": description, }
        return render(request, 'index.html')


def description(request):
    description = Description.objects.get(id=1)

    return HttpResponse(description.json)
