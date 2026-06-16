.class public Lnet/nyx/postest/App;
.super Landroid/app/Application;
.source "App.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 2
    invoke-static {p0}, Ld/a/b/a;->a(Landroid/app/Application;)Ld/a/b/a;

    return-void
.end method
