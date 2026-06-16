.class public final Ld/a/a/d$d;
.super Ljava/lang/Object;
.source "BaseDialog.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;
.implements Ld/a/a/d$m;
.implements Ld/a/a/d$k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public h:Ld/a/a/d;

.field public i:Landroid/app/Activity;

.field public j:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ld/a/a/d;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    .line 3
    invoke-virtual {p2, p0}, Ld/a/a/d;->a(Ld/a/a/d$m;)V

    .line 4
    invoke-virtual {p2, p0}, Ld/a/a/d;->a(Ld/a/a/d$k;)V

    return-void
.end method

.method public static synthetic a(Landroid/app/Activity;Ld/a/a/d;)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Ld/a/a/d$d;->b(Landroid/app/Activity;Ld/a/a/d;)V

    return-void
.end method

.method public static b(Landroid/app/Activity;Ld/a/a/d;)V
    .registers 3

    .line 1
    new-instance v0, Ld/a/a/d$d;

    invoke-direct {v0, p0, p1}, Ld/a/a/d$d;-><init>(Landroid/app/Activity;Ld/a/a/d;)V

    return-void
.end method


# virtual methods
.method public synthetic a()V
    .registers 3

    .line 2
    iget-object v0, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_12

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    iget v1, p0, Ld/a/a/d$d;->j:I

    invoke-virtual {v0, v1}, Ld/a/a/d;->f(I)V

    :cond_12
    :goto_12
    return-void
.end method

.method public a(Ld/a/a/d;)V
    .registers 2

    .line 4
    iput-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    .line 5
    invoke-virtual {p0}, Ld/a/a/d$d;->b()V

    return-void
.end method

.method public final b()V
    .registers 4

    .line 4
    iget-object v0, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    if-nez v0, :cond_5

    return-void

    .line 5
    :cond_5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_f

    .line 6
    invoke-virtual {v0, p0}, Landroid/app/Activity;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_16

    .line 7
    :cond_f
    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :goto_16
    return-void
.end method

.method public b(Ld/a/a/d;)V
    .registers 2

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    .line 3
    invoke-virtual {p0}, Ld/a/a/d$d;->c()V

    return-void
.end method

.method public final c()V
    .registers 4

    .line 1
    iget-object v0, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_f

    .line 3
    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_16

    .line 4
    :cond_f
    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :goto_16
    return-void
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    if-eq v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {p0}, Ld/a/a/d$d;->c()V

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    .line 4
    iget-object v0, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    if-nez v0, :cond_10

    return-void

    .line 5
    :cond_10
    invoke-virtual {v0, p0}, Ld/a/a/d;->b(Ld/a/a/d$m;)V

    .line 6
    iget-object v0, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    invoke-virtual {v0, p0}, Ld/a/a/d;->b(Ld/a/a/d$k;)V

    .line 7
    iget-object v0, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_25

    .line 8
    iget-object v0, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    invoke-virtual {v0}, Ld/a/a/d;->dismiss()V

    .line 9
    :cond_25
    iput-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    if-eq v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    if-eqz p1, :cond_1e

    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    move-result p1

    if-nez p1, :cond_10

    goto :goto_1e

    .line 3
    :cond_10
    iget-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    invoke-virtual {p1}, Ld/a/a/d;->g()I

    move-result p1

    iput p1, p0, Ld/a/a/d$d;->j:I

    .line 4
    iget-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ld/a/a/d;->f(I)V

    :cond_1e
    :goto_1e
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 5

    .line 1
    iget-object v0, p0, Ld/a/a/d$d;->i:Landroid/app/Activity;

    if-eq v0, p1, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    move-result p1

    if-nez p1, :cond_10

    goto :goto_1c

    .line 3
    :cond_10
    iget-object p1, p0, Ld/a/a/d$d;->h:Ld/a/a/d;

    new-instance v0, Ld/a/a/b;

    invoke-direct {v0, p0}, Ld/a/a/b;-><init>(Ld/a/a/d$d;)V

    const-wide/16 v1, 0x64

    invoke-interface {p1, v0, v1, v2}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    :cond_1c
    :goto_1c
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
