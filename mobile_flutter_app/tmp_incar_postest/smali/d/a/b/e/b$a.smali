.class public Ld/a/b/e/b$a;
.super Ld/a/b/g/l/c/j;
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
    invoke-direct {p0}, Ld/a/b/g/l/c/j;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ljava/lang/String;Ld/a/b/g/l/f/b;)V
    .registers 4

    .line 1
    invoke-static {}, Ld/a/b/e/b;->d()Z

    move-result p1

    if-nez p1, :cond_9

    .line 2
    invoke-static {p2}, Ld/a/b/g/h;->a(Ljava/lang/String;)V

    :cond_9
    return-void
.end method
