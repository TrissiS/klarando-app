.class public Lb/p/d/d$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lb/p/d/d;


# direct methods
.method public constructor <init>(Lb/p/d/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/p/d/d$c;->b:Lb/p/d/d;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lb/p/d/d$c;->a:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lb/p/d/d$c;->a:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4

    .line 1
    iget-boolean p1, p0, Lb/p/d/d$c;->a:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_8

    .line 2
    iput-boolean v0, p0, Lb/p/d/d$c;->a:Z

    return-void

    .line 3
    :cond_8
    iget-object p1, p0, Lb/p/d/d$c;->b:Lb/p/d/d;

    iget-object p1, p1, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/4 v1, 0x0

    cmpl-float p1, p1, v1

    if-nez p1, :cond_23

    .line 4
    iget-object p1, p0, Lb/p/d/d$c;->b:Lb/p/d/d;

    iput v0, p1, Lb/p/d/d;->A:I

    .line 5
    invoke-virtual {p1, v0}, Lb/p/d/d;->c(I)V

    goto :goto_2b

    .line 6
    :cond_23
    iget-object p1, p0, Lb/p/d/d$c;->b:Lb/p/d/d;

    const/4 v0, 0x2

    iput v0, p1, Lb/p/d/d;->A:I

    .line 7
    invoke-virtual {p1}, Lb/p/d/d;->f()V

    :goto_2b
    return-void
.end method
