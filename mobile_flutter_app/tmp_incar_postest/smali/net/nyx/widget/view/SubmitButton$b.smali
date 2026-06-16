.class public Lnet/nyx/widget/view/SubmitButton$b;
.super Ljava/lang/Object;
.source "SubmitButton.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/nyx/widget/view/SubmitButton;->d()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lnet/nyx/widget/view/SubmitButton;


# direct methods
.method public constructor <init>(Lnet/nyx/widget/view/SubmitButton;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/view/SubmitButton$b;->a:Lnet/nyx/widget/view/SubmitButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 2

    .line 1
    iget-object p1, p0, Lnet/nyx/widget/view/SubmitButton$b;->a:Lnet/nyx/widget/view/SubmitButton;

    invoke-virtual {p1}, Landroid/widget/Button;->requestLayout()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method
