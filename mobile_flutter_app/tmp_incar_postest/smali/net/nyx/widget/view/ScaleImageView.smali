.class public final Lnet/nyx/widget/view/ScaleImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "ScaleImageView.java"


# instance fields
.field public j:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/ScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/ScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p3, 0x3f99999a    # 1.2f

    .line 4
    iput p3, p0, Lnet/nyx/widget/view/ScaleImageView;->j:F

    .line 5
    sget-object p3, Ld/a/d/f;->ScaleImageView:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    sget p2, Ld/a/d/f;->ScaleImageView_scaleRatio:I

    iget p3, p0, Lnet/nyx/widget/view/ScaleImageView;->j:F

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/ScaleImageView;->setScaleSize(F)V

    .line 7
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public dispatchSetPressed(Z)V
    .registers 2

    if-eqz p1, :cond_d

    .line 1
    iget p1, p0, Lnet/nyx/widget/view/ScaleImageView;->j:F

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 2
    iget p1, p0, Lnet/nyx/widget/view/ScaleImageView;->j:F

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    goto :goto_15

    :cond_d
    const/high16 p1, 0x3f800000    # 1.0f

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    :goto_15
    return-void
.end method

.method public setScaleSize(F)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/widget/view/ScaleImageView;->j:F

    return-void
.end method
