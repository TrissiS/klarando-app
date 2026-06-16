.class public Lc/c/d/h;
.super Landroid/os/Handler;
.source "ToastStrategy.java"

# interfaces
.implements Lc/c/d/k/d;


# instance fields
.field public a:Landroid/app/Application;

.field public b:Lc/c/d/b;

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lc/c/d/k/b;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lc/c/d/k/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/c/d/k/f<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/app/Application;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/d/h;->a:Landroid/app/Application;

    .line 2
    invoke-static {p1}, Lc/c/d/b;->a(Landroid/app/Application;)Lc/c/d/b;

    move-result-object p1

    iput-object p1, p0, Lc/c/d/h;->b:Lc/c/d/b;

    return-void
.end method

.method public a(Lc/c/d/k/f;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/c/d/k/f<",
            "*>;)V"
        }
    .end annotation

    .line 3
    iput-object p1, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 6

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 6
    iput v0, v1, Landroid/os/Message;->what:I

    .line 7
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    const-wide/16 v2, 0xc8

    .line 8
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method public b(Ljava/lang/CharSequence;)I
    .registers 3

    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    const/16 v0, 0x14

    if-le p1, v0, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    return p1
.end method

.method public b(Landroid/app/Application;)Lc/c/d/k/b;
    .registers 5

    .line 1
    iget-object v0, p0, Lc/c/d/h;->b:Lc/c/d/b;

    invoke-virtual {v0}, Lc/c/d/b;->a()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 2
    new-instance v1, Lc/c/d/c;

    invoke-direct {v1, v0}, Lc/c/d/c;-><init>(Landroid/app/Activity;)V

    goto :goto_1f

    .line 3
    :cond_e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-ne v0, v1, :cond_1a

    .line 4
    new-instance v1, Lc/c/d/e;

    invoke-direct {v1, p1}, Lc/c/d/e;-><init>(Landroid/app/Application;)V

    goto :goto_1f

    .line 5
    :cond_1a
    new-instance v1, Lc/c/d/f;

    invoke-direct {v1, p1}, Lc/c/d/f;-><init>(Landroid/app/Application;)V

    .line 6
    :goto_1f
    instance-of v0, v1, Lc/c/d/c;

    if-nez v0, :cond_31

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v0, v2, :cond_31

    .line 7
    invoke-virtual {p1}, Landroid/app/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    if-ge v0, v2, :cond_5e

    .line 8
    :cond_31
    iget-object v0, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    invoke-interface {v0, p1}, Lc/c/d/k/f;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    invoke-interface {v1, p1}, Lc/c/d/k/b;->setView(Landroid/view/View;)V

    .line 9
    iget-object p1, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    invoke-interface {p1}, Lc/c/d/k/f;->getGravity()I

    move-result p1

    iget-object v0, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    invoke-interface {v0}, Lc/c/d/k/f;->getXOffset()I

    move-result v0

    iget-object v2, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    invoke-interface {v2}, Lc/c/d/k/f;->getYOffset()I

    move-result v2

    invoke-interface {v1, p1, v0, v2}, Lc/c/d/k/b;->setGravity(III)V

    .line 10
    iget-object p1, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    invoke-interface {p1}, Lc/c/d/k/f;->getHorizontalMargin()F

    move-result p1

    iget-object v0, p0, Lc/c/d/h;->d:Lc/c/d/k/f;

    invoke-interface {v0}, Lc/c/d/k/f;->getVerticalMargin()F

    move-result v0

    invoke-interface {v1, p1, v0}, Lc/c/d/k/b;->setMargin(FF)V

    :cond_5e
    return-object v1
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/c/d/h;->c:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/c/d/k/b;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    .line 3
    :goto_c
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1c

    const/4 p1, 0x2

    if-eq v1, p1, :cond_15

    goto :goto_44

    :cond_15
    if-nez v0, :cond_18

    goto :goto_44

    .line 4
    :cond_18
    invoke-interface {v0}, Lc/c/d/k/b;->cancel()V

    goto :goto_44

    .line 5
    :cond_1c
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v1, p1, Ljava/lang/CharSequence;

    if-nez v1, :cond_23

    goto :goto_44

    .line 6
    :cond_23
    check-cast p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_2a

    .line 7
    invoke-interface {v0}, Lc/c/d/k/b;->cancel()V

    .line 8
    :cond_2a
    iget-object v0, p0, Lc/c/d/h;->a:Landroid/app/Application;

    invoke-virtual {p0, v0}, Lc/c/d/h;->b(Landroid/app/Application;)Lc/c/d/k/b;

    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lc/c/d/h;->c:Ljava/lang/ref/WeakReference;

    .line 10
    invoke-virtual {p0, p1}, Lc/c/d/h;->b(Ljava/lang/CharSequence;)I

    move-result v1

    invoke-interface {v0, v1}, Lc/c/d/k/b;->setDuration(I)V

    .line 11
    invoke-interface {v0, p1}, Lc/c/d/k/b;->setText(Ljava/lang/CharSequence;)V

    .line 12
    invoke-interface {v0}, Lc/c/d/k/b;->show()V

    :goto_44
    return-void
.end method
