.class public Ld/a/b/e/b$b;
.super Ld/a/b/g/l/c/i;
.source "LibsConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/e/b;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/i;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/app/Activity;)Landroid/app/Dialog;
    .registers 2

    const/4 p1, 0x0

    return-object p1
.end method
