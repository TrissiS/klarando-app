.class public final Lc/b/a/f;
.super Landroid/database/ContentObserver;
.source "EMUI3NavigationBarObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/b/a/f$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lc/b/a/i;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/app/Application;

.field public c:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 2
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    const/4 v0, 0x0

    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/f;->c:Ljava/lang/Boolean;

    return-void
.end method

.method public synthetic constructor <init>(Lc/b/a/f$a;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Lc/b/a/f;-><init>()V

    return-void
.end method

.method public static a()Lc/b/a/f;
    .registers 1

    .line 1
    invoke-static {}, Lc/b/a/f$b;->a()Lc/b/a/f;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public a(Landroid/app/Application;)V
    .registers 4

    .line 2
    iput-object p1, p0, Lc/b/a/f;->b:Landroid/app/Application;

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_30

    if-eqz p1, :cond_30

    .line 4
    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    if-eqz p1, :cond_30

    iget-object p1, p0, Lc/b/a/f;->c:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_30

    const-string p1, "navigationbar_is_min"

    .line 5
    invoke-static {p1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_30

    .line 6
    iget-object v0, p0, Lc/b/a/f;->b:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 7
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/f;->c:Ljava/lang/Boolean;

    :cond_30
    return-void
.end method

.method public a(Lc/b/a/i;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    .line 8
    :cond_3
    iget-object v0, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    if-nez v0, :cond_e

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    .line 10
    :cond_e
    iget-object v0, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    .line 11
    iget-object v0, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    return-void
.end method

.method public b(Lc/b/a/i;)V
    .registers 3

    if-eqz p1, :cond_a

    .line 1
    iget-object v0, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    if-nez v0, :cond_7

    goto :goto_a

    .line 2
    :cond_7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_a
    :goto_a
    return-void
.end method

.method public onChange(Z)V
    .registers 6

    .line 1
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x11

    if-lt p1, v0, :cond_45

    iget-object p1, p0, Lc/b/a/f;->b:Landroid/app/Application;

    if-eqz p1, :cond_45

    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    if-eqz p1, :cond_45

    iget-object p1, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    if-eqz p1, :cond_45

    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_45

    .line 4
    iget-object p1, p0, Lc/b/a/f;->b:Landroid/app/Application;

    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "navigationbar_is_min"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 5
    iget-object v1, p0, Lc/b/a/f;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_30
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/b/a/i;

    const/4 v3, 0x1

    if-eq p1, v3, :cond_40

    goto :goto_41

    :cond_40
    const/4 v3, 0x0

    .line 6
    :goto_41
    invoke-interface {v2, v3}, Lc/b/a/p;->a(Z)V

    goto :goto_30

    :cond_45
    return-void
.end method
