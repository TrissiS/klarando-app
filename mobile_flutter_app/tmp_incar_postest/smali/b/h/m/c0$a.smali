.class public Lb/h/m/c0$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ViewPropertyAnimatorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/m/c0;->a(Landroid/view/View;Lb/h/m/d0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lb/h/m/d0;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public constructor <init>(Lb/h/m/c0;Lb/h/m/d0;Landroid/view/View;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lb/h/m/c0$a;->a:Lb/h/m/d0;

    iput-object p3, p0, Lb/h/m/c0$a;->b:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/h/m/c0$a;->a:Lb/h/m/d0;

    iget-object v0, p0, Lb/h/m/c0$a;->b:Landroid/view/View;

    invoke-interface {p1, v0}, Lb/h/m/d0;->c(Landroid/view/View;)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/h/m/c0$a;->a:Lb/h/m/d0;

    iget-object v0, p0, Lb/h/m/c0$a;->b:Landroid/view/View;

    invoke-interface {p1, v0}, Lb/h/m/d0;->a(Landroid/view/View;)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/h/m/c0$a;->a:Lb/h/m/d0;

    iget-object v0, p0, Lb/h/m/c0$a;->b:Landroid/view/View;

    invoke-interface {p1, v0}, Lb/h/m/d0;->b(Landroid/view/View;)V

    return-void
.end method
