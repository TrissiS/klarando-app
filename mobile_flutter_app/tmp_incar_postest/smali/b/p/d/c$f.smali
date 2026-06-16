.class public Lb/p/d/c$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DefaultItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/p/d/c;->b(Landroidx/recyclerview/widget/RecyclerView$b0;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView$b0;

.field public final synthetic b:I

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:I

.field public final synthetic e:Landroid/view/ViewPropertyAnimator;

.field public final synthetic f:Lb/p/d/c;


# direct methods
.method public constructor <init>(Lb/p/d/c;Landroidx/recyclerview/widget/RecyclerView$b0;ILandroid/view/View;ILandroid/view/ViewPropertyAnimator;)V
    .registers 7

    .line 1
    iput-object p1, p0, Lb/p/d/c$f;->f:Lb/p/d/c;

    iput-object p2, p0, Lb/p/d/c$f;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    iput p3, p0, Lb/p/d/c$f;->b:I

    iput-object p4, p0, Lb/p/d/c$f;->c:Landroid/view/View;

    iput p5, p0, Lb/p/d/c$f;->d:I

    iput-object p6, p0, Lb/p/d/c$f;->e:Landroid/view/ViewPropertyAnimator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget p1, p0, Lb/p/d/c$f;->b:I

    const/4 v0, 0x0

    if-eqz p1, :cond_a

    .line 2
    iget-object p1, p0, Lb/p/d/c$f;->c:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    :cond_a
    iget p1, p0, Lb/p/d/c$f;->d:I

    if-eqz p1, :cond_13

    .line 4
    iget-object p1, p0, Lb/p/d/c$f;->c:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_13
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/p/d/c$f;->e:Landroid/view/ViewPropertyAnimator;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 2
    iget-object p1, p0, Lb/p/d/c$f;->f:Lb/p/d/c;

    iget-object v0, p0, Lb/p/d/c$f;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {p1, v0}, Lb/p/d/m;->j(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 3
    iget-object p1, p0, Lb/p/d/c$f;->f:Lb/p/d/c;

    iget-object p1, p1, Lb/p/d/c;->p:Ljava/util/ArrayList;

    iget-object v0, p0, Lb/p/d/c$f;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    iget-object p1, p0, Lb/p/d/c$f;->f:Lb/p/d/c;

    invoke-virtual {p1}, Lb/p/d/c;->j()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/p/d/c$f;->f:Lb/p/d/c;

    iget-object v0, p0, Lb/p/d/c$f;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {p1, v0}, Lb/p/d/m;->k(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method
