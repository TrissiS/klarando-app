.class public final Ld/a/b/g/l/g/a;
.super Ljava/lang/Object;
.source "ActivityManager.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field public static j:Ld/a/b/g/l/g/a;


# instance fields
.field public h:Landroid/content/Context;

.field public i:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ld/a/b/g/l/g/a;

    invoke-direct {v0}, Ld/a/b/g/l/g/a;-><init>()V

    sput-object v0, Ld/a/b/g/l/g/a;->j:Ld/a/b/g/l/g/a;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    return-void
.end method

.method public static d()Ld/a/b/g/l/g/a;
    .registers 1

    .line 1
    sget-object v0, Ld/a/b/g/l/g/a;->j:Ld/a/b/g/l/g/a;

    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 4
    :cond_0
    :goto_0
    iget-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 5
    iget-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_1a
    return-void
.end method

.method public a(Landroid/content/Context;)V
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    .line 2
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ld/a/b/g/l/g/a;->h:Landroid/content/Context;

    return-void
.end method

.method public b()Landroid/content/Context;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/g/a;->h:Landroid/content/Context;

    return-object v0
.end method

.method public c()Landroid/app/Activity;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return-object v0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 1
    iget-object p2, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_d

    .line 2
    iget-object p2, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/g/a;->i:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method
