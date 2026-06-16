.class public final Lc/b/a/k;
.super Landroid/database/ContentObserver;
.source "NavigationBarObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/b/a/k$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lc/b/a/p;",
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

    iput-object v0, p0, Lc/b/a/k;->c:Ljava/lang/Boolean;

    return-void
.end method

.method public synthetic constructor <init>(Lc/b/a/k$a;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Lc/b/a/k;-><init>()V

    return-void
.end method

.method public static a()Lc/b/a/k;
    .registers 1

    .line 1
    invoke-static {}, Lc/b/a/k$b;->a()Lc/b/a/k;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public a(Landroid/app/Application;)V
    .registers 4

    .line 2
    iput-object p1, p0, Lc/b/a/k;->b:Landroid/app/Application;

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_56

    if-eqz p1, :cond_56

    .line 4
    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    if-eqz p1, :cond_56

    iget-object p1, p0, Lc/b/a/k;->c:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_56

    const/4 p1, 0x0

    .line 5
    invoke-static {}, Lc/b/a/m;->k()Z

    move-result v0

    if-eqz v0, :cond_26

    const-string p1, "force_fsg_nav_bar"

    .line 6
    invoke-static {p1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_44

    .line 7
    :cond_26
    invoke-static {}, Lc/b/a/m;->e()Z

    move-result v0

    if-eqz v0, :cond_44

    .line 8
    invoke-static {}, Lc/b/a/m;->h()Z

    move-result p1

    const-string v0, "navigationbar_is_min"

    if-nez p1, :cond_40

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge p1, v1, :cond_3b

    goto :goto_40

    .line 9
    :cond_3b
    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_44

    .line 10
    :cond_40
    :goto_40
    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :cond_44
    :goto_44
    if-eqz p1, :cond_56

    .line 11
    iget-object v0, p0, Lc/b/a/k;->b:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 12
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lc/b/a/k;->c:Ljava/lang/Boolean;

    :cond_56
    return-void
.end method

.method public a(Lc/b/a/p;)V
    .registers 3

    if-eqz p1, :cond_a

    .line 13
    iget-object v0, p0, Lc/b/a/k;->a:Ljava/util/ArrayList;

    if-nez v0, :cond_7

    goto :goto_a

    .line 14
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

    if-lt p1, v0, :cond_78

    iget-object p1, p0, Lc/b/a/k;->b:Landroid/app/Application;

    if-eqz p1, :cond_78

    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    if-eqz p1, :cond_78

    iget-object p1, p0, Lc/b/a/k;->a:Ljava/util/ArrayList;

    if-eqz p1, :cond_78

    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_78

    .line 4
    invoke-static {}, Lc/b/a/m;->k()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_31

    .line 5
    iget-object p1, p0, Lc/b/a/k;->b:Landroid/app/Application;

    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v1, "force_fsg_nav_bar"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    goto :goto_5d

    .line 6
    :cond_31
    invoke-static {}, Lc/b/a/m;->e()Z

    move-result p1

    if-eqz p1, :cond_5c

    .line 7
    invoke-static {}, Lc/b/a/m;->h()Z

    move-result p1

    const-string v1, "navigationbar_is_min"

    if-nez p1, :cond_51

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge p1, v2, :cond_46

    goto :goto_51

    .line 8
    :cond_46
    iget-object p1, p0, Lc/b/a/k;->b:Landroid/app/Application;

    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    goto :goto_5d

    .line 9
    :cond_51
    :goto_51
    iget-object p1, p0, Lc/b/a/k;->b:Landroid/app/Application;

    invoke-virtual {p1}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    goto :goto_5d

    :cond_5c
    const/4 p1, 0x0

    .line 10
    :goto_5d
    iget-object v1, p0, Lc/b/a/k;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_63
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_78

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/b/a/p;

    const/4 v3, 0x1

    if-eq p1, v3, :cond_73

    goto :goto_74

    :cond_73
    const/4 v3, 0x0

    .line 11
    :goto_74
    invoke-interface {v2, v3}, Lc/b/a/p;->a(Z)V

    goto :goto_63

    :cond_78
    return-void
.end method
