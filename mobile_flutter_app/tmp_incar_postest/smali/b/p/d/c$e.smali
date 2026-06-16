.class public Lb/p/d/c$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DefaultItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/p/d/c;->t(Landroidx/recyclerview/widget/RecyclerView$b0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView$b0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/ViewPropertyAnimator;

.field public final synthetic d:Lb/p/d/c;


# direct methods
.method public constructor <init>(Lb/p/d/c;Landroidx/recyclerview/widget/RecyclerView$b0;Landroid/view/View;Landroid/view/ViewPropertyAnimator;)V
    .registers 5

    .line 1
    iput-object p1, p0, Lb/p/d/c$e;->d:Lb/p/d/c;

    iput-object p2, p0, Lb/p/d/c$e;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    iput-object p3, p0, Lb/p/d/c$e;->b:Landroid/view/View;

    iput-object p4, p0, Lb/p/d/c$e;->c:Landroid/view/ViewPropertyAnimator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/p/d/c$e;->b:Landroid/view/View;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/p/d/c$e;->c:Landroid/view/ViewPropertyAnimator;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 2
    iget-object p1, p0, Lb/p/d/c$e;->d:Lb/p/d/c;

    iget-object v0, p0, Lb/p/d/c$e;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {p1, v0}, Lb/p/d/m;->h(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 3
    iget-object p1, p0, Lb/p/d/c$e;->d:Lb/p/d/c;

    iget-object p1, p1, Lb/p/d/c;->o:Ljava/util/ArrayList;

    iget-object v0, p0, Lb/p/d/c$e;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    iget-object p1, p0, Lb/p/d/c$e;->d:Lb/p/d/c;

    invoke-virtual {p1}, Lb/p/d/c;->j()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/p/d/c$e;->d:Lb/p/d/c;

    iget-object v0, p0, Lb/p/d/c$e;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {p1, v0}, Lb/p/d/m;->i(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method
