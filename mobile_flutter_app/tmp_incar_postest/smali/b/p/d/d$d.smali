.class public Lb/p/d/d$d;
.super Ljava/lang/Object;
.source "FastScroller.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lb/p/d/d;


# direct methods
.method public constructor <init>(Lb/p/d/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/p/d/d$d;->a:Lb/p/d/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 2
    iget-object v0, p0, Lb/p/d/d$d;->a:Lb/p/d/d;

    iget-object v0, v0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    .line 3
    iget-object v0, p0, Lb/p/d/d$d;->a:Lb/p/d/d;

    iget-object v0, v0, Lb/p/d/d;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4
    iget-object p1, p0, Lb/p/d/d$d;->a:Lb/p/d/d;

    invoke-virtual {p1}, Lb/p/d/d;->f()V

    return-void
.end method
