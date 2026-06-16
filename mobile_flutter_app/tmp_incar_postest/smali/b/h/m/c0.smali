.class public final Lb/h/m/c0;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/c0$c;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/Runnable;

.field public c:Ljava/lang/Runnable;

.field public d:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/h/m/c0;->b:Ljava/lang/Runnable;

    .line 3
    iput-object v0, p0, Lb/h/m/c0;->c:Ljava/lang/Runnable;

    const/4 v0, -0x1

    .line 4
    iput v0, p0, Lb/h/m/c0;->d:I

    .line 5
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public a(F)Lb/h/m/c0;
    .registers 3

    .line 3
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 4
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    :cond_11
    return-object p0
.end method

.method public a(J)Lb/h/m/c0;
    .registers 4

    .line 1
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    :cond_11
    return-object p0
.end method

.method public a(Landroid/view/animation/Interpolator;)Lb/h/m/c0;
    .registers 3

    .line 5
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 6
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    :cond_11
    return-object p0
.end method

.method public a(Lb/h/m/d0;)Lb/h/m/c0;
    .registers 5

    .line 9
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_21

    .line 10
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_14

    .line 11
    invoke-virtual {p0, v0, p1}, Lb/h/m/c0;->a(Landroid/view/View;Lb/h/m/d0;)V

    goto :goto_21

    :cond_14
    const/high16 v1, 0x7e000000

    .line 12
    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 13
    new-instance p1, Lb/h/m/c0$c;

    invoke-direct {p1, p0}, Lb/h/m/c0$c;-><init>(Lb/h/m/c0;)V

    invoke-virtual {p0, v0, p1}, Lb/h/m/c0;->a(Landroid/view/View;Lb/h/m/d0;)V

    :cond_21
    :goto_21
    return-object p0
.end method

.method public a(Lb/h/m/f0;)Lb/h/m/c0;
    .registers 5

    .line 16
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_1f

    .line 17
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1f

    const/4 v1, 0x0

    if-eqz p1, :cond_18

    .line 18
    new-instance v1, Lb/h/m/c0$b;

    invoke-direct {v1, p0, p1, v0}, Lb/h/m/c0$b;-><init>(Lb/h/m/c0;Lb/h/m/f0;Landroid/view/View;)V

    .line 19
    :cond_18
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    :cond_1f
    return-object p0
.end method

.method public a()V
    .registers 2

    .line 7
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    :cond_11
    return-void
.end method

.method public final a(Landroid/view/View;Lb/h/m/d0;)V
    .registers 5

    if-eqz p2, :cond_f

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lb/h/m/c0$a;

    invoke-direct {v1, p0, p2, p1}, Lb/h/m/c0$a;-><init>(Lb/h/m/c0;Lb/h/m/d0;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    goto :goto_17

    .line 15
    :cond_f
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    :goto_17
    return-void
.end method

.method public b()J
    .registers 3

    .line 3
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_13

    .line 4
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->getDuration()J

    move-result-wide v0

    return-wide v0

    :cond_13
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public b(F)Lb/h/m/c0;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    :cond_11
    return-object p0
.end method

.method public b(J)Lb/h/m/c0;
    .registers 4

    .line 5
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 6
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    :cond_11
    return-object p0
.end method

.method public c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/c0;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_11

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_11
    return-void
.end method
