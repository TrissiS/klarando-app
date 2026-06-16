.class public Lb/h/m/r;
.super Ljava/lang/Object;
.source "NestedScrollingParentHelper.java"


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 3

    .line 4
    iget v0, p0, Lb/h/m/r;->a:I

    iget v1, p0, Lb/h/m/r;->b:I

    or-int/2addr v0, v1

    return v0
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Lb/h/m/r;->a(Landroid/view/View;I)V

    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 4

    const/4 p1, 0x0

    const/4 v0, 0x1

    if-ne p2, v0, :cond_7

    .line 6
    iput p1, p0, Lb/h/m/r;->b:I

    goto :goto_9

    .line 7
    :cond_7
    iput p1, p0, Lb/h/m/r;->a:I

    :goto_9
    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/h/m/r;->a(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/View;II)V
    .registers 5

    const/4 p1, 0x1

    if-ne p4, p1, :cond_6

    .line 2
    iput p3, p0, Lb/h/m/r;->b:I

    goto :goto_8

    .line 3
    :cond_6
    iput p3, p0, Lb/h/m/r;->a:I

    :goto_8
    return-void
.end method
