.class public final Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;
.super Lc/a/a/a/h0/c;
.source "CircularProgressIndicatorSpec.java"


# instance fields
.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 1
    sget v0, Lc/a/a/a/b;->circularProgressIndicatorStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    .line 2
    sget v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;->v:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 14

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Lc/a/a/a/h0/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/d;->mtrl_progress_circular_size_medium:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/d;->mtrl_progress_circular_inset_medium:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 6
    sget-object v4, Lc/a/a/a/l;->CircularProgressIndicator:[I

    const/4 v8, 0x0

    new-array v7, v8, [I

    move-object v2, p1

    move-object v3, p2

    move v5, p3

    move v6, p4

    .line 7
    invoke-static/range {v2 .. v7}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 8
    sget p3, Lc/a/a/a/l;->CircularProgressIndicator_indicatorSize:I

    .line 9
    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;II)I

    move-result p3

    iget p4, p0, Lc/a/a/a/h0/c;->a:I

    mul-int/lit8 p4, p4, 0x2

    .line 10
    invoke-static {p3, p4}, Ljava/lang/Math;->max(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->g:I

    .line 11
    sget p3, Lc/a/a/a/l;->CircularProgressIndicator_indicatorInset:I

    .line 12
    invoke-static {p1, p2, p3, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->h:I

    .line 13
    sget p1, Lc/a/a/a/l;->CircularProgressIndicator_indicatorDirectionCircular:I

    .line 14
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->i:I

    .line 15
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 16
    invoke-virtual {p0}, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->c()V

    return-void
.end method


# virtual methods
.method public c()V
    .registers 1

    return-void
.end method
