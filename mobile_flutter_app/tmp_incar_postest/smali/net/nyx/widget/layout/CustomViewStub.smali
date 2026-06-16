.class public final Lnet/nyx/widget/layout/CustomViewStub;
.super Landroid/widget/FrameLayout;
.source "CustomViewStub.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/nyx/widget/layout/CustomViewStub$a;
    }
.end annotation


# instance fields
.field public h:Lnet/nyx/widget/layout/CustomViewStub$a;

.field public final i:I

.field public j:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/layout/CustomViewStub;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/layout/CustomViewStub;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lnet/nyx/widget/layout/CustomViewStub;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    sget-object p3, Ld/a/d/f;->CustomViewStub:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    sget p2, Ld/a/d/f;->CustomViewStub_android_layout:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/layout/CustomViewStub;->i:I

    .line 7
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    const/16 p1, 0x8

    .line 8
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/CustomViewStub;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public getInflateView()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/CustomViewStub;->j:Landroid/view/View;

    return-object v0
.end method

.method public setCustomVisibility(I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method

.method public setOnViewStubListener(Lnet/nyx/widget/layout/CustomViewStub$a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/layout/CustomViewStub;->h:Lnet/nyx/widget/layout/CustomViewStub$a;

    return-void
.end method

.method public setVisibility(I)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/CustomViewStub;->j:Landroid/view/View;

    if-nez v0, :cond_4e

    const/16 v0, 0x8

    if-eq p1, v0, :cond_4e

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p0, Lnet/nyx/widget/layout/CustomViewStub;->i:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/widget/layout/CustomViewStub;->j:Landroid/view/View;

    .line 4
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 7
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_3b

    const/16 v1, 0x11

    .line 8
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 9
    :cond_3b
    iget-object v1, p0, Lnet/nyx/widget/layout/CustomViewStub;->j:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    iget-object v0, p0, Lnet/nyx/widget/layout/CustomViewStub;->j:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 11
    iget-object v0, p0, Lnet/nyx/widget/layout/CustomViewStub;->h:Lnet/nyx/widget/layout/CustomViewStub$a;

    if-eqz v0, :cond_4e

    .line 12
    iget-object v1, p0, Lnet/nyx/widget/layout/CustomViewStub;->j:Landroid/view/View;

    invoke-interface {v0, p0, v1}, Lnet/nyx/widget/layout/CustomViewStub$a;->a(Lnet/nyx/widget/layout/CustomViewStub;Landroid/view/View;)V

    .line 13
    :cond_4e
    iget-object v0, p0, Lnet/nyx/widget/layout/CustomViewStub;->h:Lnet/nyx/widget/layout/CustomViewStub$a;

    if-eqz v0, :cond_55

    .line 14
    invoke-interface {v0, p0, p1}, Lnet/nyx/widget/layout/CustomViewStub$a;->a(Lnet/nyx/widget/layout/CustomViewStub;I)V

    :cond_55
    return-void
.end method
