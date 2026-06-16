.class public final Lnet/nyx/widget/view/PressAlphaTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "PressAlphaTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public dispatchSetPressed(Z)V
    .registers 2

    if-eqz p1, :cond_8

    const/high16 p1, 0x3f000000    # 0.5f

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    goto :goto_d

    :cond_8
    const/high16 p1, 0x3f800000    # 1.0f

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    :goto_d
    return-void
.end method
