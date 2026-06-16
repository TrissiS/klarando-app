.class public final synthetic Ld/a/d/i/a;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final synthetic a:Lnet/nyx/widget/view/FloatActionButton;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/widget/view/FloatActionButton;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/d/i/a;->a:Lnet/nyx/widget/view/FloatActionButton;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3

    iget-object v0, p0, Ld/a/d/i/a;->a:Lnet/nyx/widget/view/FloatActionButton;

    invoke-virtual {v0, p1}, Lnet/nyx/widget/view/FloatActionButton;->a(Landroid/animation/ValueAnimator;)V

    return-void
.end method
