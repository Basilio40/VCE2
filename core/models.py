from django.db import models
from django.db.models.fields import DateField

# Create your models here.

class EPS(models.Model):
    NEPS = models.CharField(max_length=200, null=True, blank=True)
    NRQPS = models.CharField(max_length=200, null=True, blank=True)
    processo = models.CharField(max_length=200, null=True, blank=True)
    progressao_soldagem = models.CharField(max_length=200, null=True, blank=True)
    posicao_soldagem = models.CharField(max_length=200, null=True, blank=True)
    especificacao = models.CharField(max_length=200, null=True, blank=True)
    PN = models.IntegerField(default=0)
    faixa_esp = models.CharField(max_length=200, null=True, blank=True)
    faixa_diam = models.CharField(max_length=200, null=True, blank=True)
    especificacao_metal_ad = models.CharField(max_length=200, null=True, blank=True)
    classificacao = models.CharField(max_length=200, null=True, blank=True)
    FN = models.IntegerField(default=0)
    qrcode = models.ImageField(upload_to= "core\static\core\dist\img", null= True)

    def __str__(self):
        return self.NEPS

class Soldadores(models.Model):
    sinete = models.CharField(max_length=200, null=True, blank=True)
    nome = models.CharField(max_length=200, null=True, blank=True)
    EPS = models.CharField(max_length=200, null=True, blank=True)
    processo = models.CharField(max_length=200, null=True, blank=True)
    modo_trensferencia = models.CharField(max_length=200, null=True, blank=True)
    FN = models.IntegerField(default=0)
    metal_base = models.CharField(max_length=200, null=True, blank=True)
    esp_chanfro = models.CharField(max_length=200, null=True, blank=True)
    esp_angulo = models.CharField(max_length=200, null=True, blank=True)
    diametro_chanfro = models.CharField(max_length=200, null=True, blank=True)
    diametro_angulo = models.CharField(max_length=200, null=True, blank=True)
    posiçao = models.CharField(max_length=200, null=True, blank=True)
    progressao_soldagem = models.CharField(max_length=200, null=True, blank=True)
    cobre_junta = models.CharField(max_length=200, null=True, blank=True)
    notas = models.CharField(max_length=200, null=True, blank=True)
    qrcode = models.ImageField(upload_to= "core\static\core\dist\img", null= True)
    validade = models.DateField(null=True, blank=True)
    dados = models.URLField(max_length=200)

    def __str__(self):
        return self.sinete