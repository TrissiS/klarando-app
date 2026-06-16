.class public Landroidx/transition/Visibility$a;
.super Lb/s/u;
.source "Visibility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/transition/Visibility;->b(Landroid/view/ViewGroup;Lb/s/y;ILb/s/y;I)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroidx/transition/Visibility;


# direct methods
.method public constructor <init>(Landroidx/transition/Visibility;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;)V
    .registers 5

    .line 1
    iput-object p1, p0, Landroidx/transition/Visibility$a;->d:Landroidx/transition/Visibility;

    iput-object p2, p0, Landroidx/transition/Visibility$a;->a:Landroid/view/ViewGroup;

    iput-object p3, p0, Landroidx/transition/Visibility$a;->b:Landroid/view/View;

    iput-object p4, p0, Landroidx/transition/Visibility$a;->c:Landroid/view/View;

    invoke-direct {p0}, Lb/s/u;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/Visibility$a;->a:Landroid/view/ViewGroup;

    invoke-static {p1}, Lb/s/e0;->a(Landroid/view/ViewGroup;)Lb/s/d0;

    move-result-object p1

    iget-object v0, p0, Landroidx/transition/Visibility$a;->b:Landroid/view/View;

    invoke-interface {p1, v0}, Lb/s/d0;->b(Landroid/view/View;)V

    return-void
.end method

.method public b(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/Visibility$a;->b:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-nez p1, :cond_14

    .line 2
    iget-object p1, p0, Landroidx/transition/Visibility$a;->a:Landroid/view/ViewGroup;

    invoke-static {p1}, Lb/s/e0;->a(Landroid/view/ViewGroup;)Lb/s/d0;

    move-result-object p1

    iget-object v0, p0, Landroidx/transition/Visibility$a;->b:Landroid/view/View;

    invoke-interface {p1, v0}, Lb/s/d0;->a(Landroid/view/View;)V

    goto :goto_19

    .line 3
    :cond_14
    iget-object p1, p0, Landroidx/transition/Visibility$a;->d:Landroidx/transition/Visibility;

    invoke-virtual {p1}, Landroidx/transition/Transition;->a()V

    :goto_19
    return-void
.end method

.method public e(Landroidx/transition/Transition;)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/transition/Visibility$a;->c:Landroid/view/View;

    sget v1, Lb/s/p;->save_overlay_view:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 2
    iget-object v0, p0, Landroidx/transition/Visibility$a;->a:Landroid/view/ViewGroup;

    invoke-static {v0}, Lb/s/e0;->a(Landroid/view/ViewGroup;)Lb/s/d0;

    move-result-object v0

    iget-object v1, p0, Landroidx/transition/Visibility$a;->b:Landroid/view/View;

    invoke-interface {v0, v1}, Lb/s/d0;->b(Landroid/view/View;)V

    .line 3
    invoke-virtual {p1, p0}, Landroidx/transition/Transition;->b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    return-void
.end method
