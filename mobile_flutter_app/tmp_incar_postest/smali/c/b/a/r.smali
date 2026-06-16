.class public Lc/b/a/r;
.super Ljava/lang/Object;
.source "RequestManagerRetriever.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/b/a/r$b;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Landroid/os/Handler;

.field public final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/FragmentManager;",
            "Lcom/gyf/immersionbar/RequestManagerFragment;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/fragment/app/FragmentManager;",
            "Lc/b/a/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    const-class v0, Lc/b/a/h;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lc/b/a/r;->a:Ljava/lang/String;

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lc/b/a/r;->c:Ljava/util/Map;

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lc/b/a/r;->d:Ljava/util/Map;

    .line 6
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lc/b/a/r;->b:Landroid/os/Handler;

    return-void
.end method

.method public synthetic constructor <init>(Lc/b/a/r$a;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Lc/b/a/r;-><init>()V

    return-void
.end method

.method public static a()Lc/b/a/r;
    .registers 1

    .line 1
    invoke-static {}, Lc/b/a/r$b;->a()Lc/b/a/r;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_3

    return-void

    .line 23
    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a(Landroid/app/Activity;)Lc/b/a/h;
    .registers 4

    const-string v0, "activity is null"

    .line 2
    invoke-static {p1, v0}, Lc/b/a/r;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lc/b/a/r;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4
    instance-of v1, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v1, :cond_2e

    .line 5
    move-object v1, p1

    check-cast v1, Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->l()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lc/b/a/r;->a(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)Lc/b/a/t;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc/b/a/t;->a(Ljava/lang/Object;)Lc/b/a/h;

    move-result-object p1

    return-object p1

    .line 6
    :cond_2e
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lc/b/a/r;->a(Landroid/app/FragmentManager;Ljava/lang/String;)Lcom/gyf/immersionbar/RequestManagerFragment;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/gyf/immersionbar/RequestManagerFragment;->a(Ljava/lang/Object;)Lc/b/a/h;

    move-result-object p1

    return-object p1
.end method

.method public final a(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)Lc/b/a/t;
    .registers 4

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, v0}, Lc/b/a/r;->a(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Z)Lc/b/a/t;

    move-result-object p1

    return-object p1
.end method

.method public final a(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Z)Lc/b/a/t;
    .registers 7

    .line 16
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->c(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lc/b/a/t;

    const/4 v1, 0x0

    if-nez v0, :cond_34

    .line 17
    iget-object v0, p0, Lc/b/a/r;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/b/a/t;

    if-nez v0, :cond_34

    if-eqz p3, :cond_16

    return-object v1

    .line 18
    :cond_16
    new-instance v0, Lc/b/a/t;

    invoke-direct {v0}, Lc/b/a/t;-><init>()V

    .line 19
    iget-object v2, p0, Lc/b/a/r;->d:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->b()Lb/l/d/q;

    move-result-object v2

    invoke-virtual {v2, v0, p2}, Lb/l/d/q;->a(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;

    invoke-virtual {v2}, Lb/l/d/q;->b()I

    .line 21
    iget-object p2, p0, Lc/b/a/r;->b:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {p2, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    :cond_34
    if-eqz p3, :cond_41

    .line 22
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->b()Lb/l/d/q;

    move-result-object p1

    invoke-virtual {p1, v0}, Lb/l/d/q;->c(Landroidx/fragment/app/Fragment;)Lb/l/d/q;

    invoke-virtual {p1}, Lb/l/d/q;->b()I

    return-object v1

    :cond_41
    return-object v0
.end method

.method public final a(Landroid/app/FragmentManager;Ljava/lang/String;)Lcom/gyf/immersionbar/RequestManagerFragment;
    .registers 4

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, p2, v0}, Lc/b/a/r;->a(Landroid/app/FragmentManager;Ljava/lang/String;Z)Lcom/gyf/immersionbar/RequestManagerFragment;

    move-result-object p1

    return-object p1
.end method

.method public final a(Landroid/app/FragmentManager;Ljava/lang/String;Z)Lcom/gyf/immersionbar/RequestManagerFragment;
    .registers 7

    .line 8
    invoke-virtual {p1, p2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/gyf/immersionbar/RequestManagerFragment;

    const/4 v1, 0x0

    if-nez v0, :cond_35

    .line 9
    iget-object v0, p0, Lc/b/a/r;->c:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/immersionbar/RequestManagerFragment;

    if-nez v0, :cond_35

    if-eqz p3, :cond_16

    return-object v1

    .line 10
    :cond_16
    new-instance v0, Lcom/gyf/immersionbar/RequestManagerFragment;

    invoke-direct {v0}, Lcom/gyf/immersionbar/RequestManagerFragment;-><init>()V

    .line 11
    iget-object v2, p0, Lc/b/a/r;->c:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, v0, p2}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 13
    iget-object p2, p0, Lc/b/a/r;->b:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {p2, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    :cond_35
    if-eqz p3, :cond_43

    .line 14
    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-object v1

    :cond_43
    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .registers 5

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_14

    const/4 v2, 0x2

    if-eq v0, v2, :cond_a

    const/4 v1, 0x0

    goto :goto_1d

    .line 2
    :cond_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroidx/fragment/app/FragmentManager;

    .line 3
    iget-object v0, p0, Lc/b/a/r;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d

    .line 4
    :cond_14
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/app/FragmentManager;

    .line 5
    iget-object v0, p0, Lc/b/a/r;->c:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1d
    return v1
.end method
