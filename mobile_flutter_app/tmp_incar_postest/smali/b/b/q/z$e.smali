.class public Lb/b/q/z$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScrollingTabContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public final synthetic c:Lb/b/q/z;


# direct methods
.method public constructor <init>(Lb/b/q/z;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/z$e;->c:Lb/b/q/z;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lb/b/q/z$e;->a:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lb/b/q/z$e;->a:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-boolean p1, p0, Lb/b/q/z$e;->a:Z

    if-eqz p1, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object p1, p0, Lb/b/q/z$e;->c:Lb/b/q/z;

    const/4 v0, 0x0

    iput-object v0, p1, Lb/b/q/z;->q:Landroid/view/ViewPropertyAnimator;

    .line 3
    iget v0, p0, Lb/b/q/z$e;->b:I

    invoke-virtual {p1, v0}, Landroid/widget/HorizontalScrollView;->setVisibility(I)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/b/q/z$e;->c:Lb/b/q/z;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/HorizontalScrollView;->setVisibility(I)V

    .line 2
    iput-boolean v0, p0, Lb/b/q/z$e;->a:Z

    return-void
.end method
