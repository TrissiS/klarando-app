.class public Lcom/google/android/material/tabs/TabItem;
.super Landroid/view/View;
.source "TabItem.java"


# instance fields
.field public final h:Ljava/lang/CharSequence;

.field public final i:Landroid/graphics/drawable/Drawable;

.field public final j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/tabs/TabItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    sget-object v0, Lc/a/a/a/l;->TabItem:[I

    .line 4
    invoke-static {p1, p2, v0}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[I)Lb/b/q/g0;

    move-result-object p1

    .line 5
    sget p2, Lc/a/a/a/l;->TabItem_android_text:I

    invoke-virtual {p1, p2}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/material/tabs/TabItem;->h:Ljava/lang/CharSequence;

    .line 6
    sget p2, Lc/a/a/a/l;->TabItem_android_icon:I

    invoke-virtual {p1, p2}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/material/tabs/TabItem;->i:Landroid/graphics/drawable/Drawable;

    .line 7
    sget p2, Lc/a/a/a/l;->TabItem_android_layout:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lb/b/q/g0;->g(II)I

    move-result p2

    iput p2, p0, Lcom/google/android/material/tabs/TabItem;->j:I

    .line 8
    invoke-virtual {p1}, Lb/b/q/g0;->b()V

    return-void
.end method
