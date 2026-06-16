.class public Lb/l/d/d$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FragmentAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/d;->a(Landroidx/fragment/app/Fragment;Lb/l/d/d$d;Lb/l/d/r$g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroidx/fragment/app/Fragment;

.field public final synthetic d:Lb/l/d/r$g;

.field public final synthetic e:Lb/h/i/b;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/Fragment;Lb/l/d/r$g;Lb/h/i/b;)V
    .registers 6

    .line 1
    iput-object p1, p0, Lb/l/d/d$c;->a:Landroid/view/ViewGroup;

    iput-object p2, p0, Lb/l/d/d$c;->b:Landroid/view/View;

    iput-object p3, p0, Lb/l/d/d$c;->c:Landroidx/fragment/app/Fragment;

    iput-object p4, p0, Lb/l/d/d$c;->d:Lb/l/d/r$g;

    iput-object p5, p0, Lb/l/d/d$c;->e:Lb/h/i/b;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lb/l/d/d$c;->a:Landroid/view/ViewGroup;

    iget-object v0, p0, Lb/l/d/d$c;->b:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 2
    iget-object p1, p0, Lb/l/d/d$c;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->m()Landroid/animation/Animator;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lb/l/d/d$c;->c:Landroidx/fragment/app/Fragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->a(Landroid/animation/Animator;)V

    if-eqz p1, :cond_28

    .line 4
    iget-object p1, p0, Lb/l/d/d$c;->a:Landroid/view/ViewGroup;

    iget-object v0, p0, Lb/l/d/d$c;->b:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    if-gez p1, :cond_28

    .line 5
    iget-object p1, p0, Lb/l/d/d$c;->d:Lb/l/d/r$g;

    iget-object v0, p0, Lb/l/d/d$c;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, p0, Lb/l/d/d$c;->e:Lb/h/i/b;

    invoke-interface {p1, v0, v1}, Lb/l/d/r$g;->a(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    :cond_28
    return-void
.end method
