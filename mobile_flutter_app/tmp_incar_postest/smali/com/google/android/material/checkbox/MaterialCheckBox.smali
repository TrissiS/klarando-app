.class public Lcom/google/android/material/checkbox/MaterialCheckBox;
.super Landroidx/appcompat/widget/AppCompatCheckBox;
.source "MaterialCheckBox.java"


# static fields
.field public static final m:I

.field public static final n:[[I


# instance fields
.field public k:Landroid/content/res/ColorStateList;

.field public l:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_CompoundButton_CheckBox:I

    sput v0, Lcom/google/android/material/checkbox/MaterialCheckBox;->m:I

    const/4 v0, 0x4

    new-array v0, v0, [[I

    const/4 v1, 0x2

    new-array v2, v1, [I

    .line 2
    fill-array-data v2, :array_2a

    const/4 v3, 0x0

    aput-object v2, v0, v3

    new-array v2, v1, [I

    fill-array-data v2, :array_32

    const/4 v3, 0x1

    aput-object v2, v0, v3

    new-array v2, v1, [I

    fill-array-data v2, :array_3a

    aput-object v2, v0, v1

    new-array v1, v1, [I

    fill-array-data v1, :array_42

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/material/checkbox/MaterialCheckBox;->n:[[I

    return-void

    :array_2a
    .array-data 4
        0x101009e
        0x10100a0
    .end array-data

    :array_32
    .array-data 4
        0x101009e
        -0x10100a0
    .end array-data

    :array_3a
    .array-data 4
        -0x101009e
        0x10100a0
    .end array-data

    :array_42
    .array-data 4
        -0x101009e
        -0x10100a0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/checkbox/MaterialCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->checkboxStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/checkbox/MaterialCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11

    .line 3
    sget v0, Lcom/google/android/material/checkbox/MaterialCheckBox;->m:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 5
    sget-object v2, Lc/a/a/a/l;->MaterialCheckBox:[I

    sget v4, Lcom/google/android/material/checkbox/MaterialCheckBox;->m:I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    .line 6
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 7
    sget p3, Lc/a/a/a/l;->MaterialCheckBox_buttonTint:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    if-eqz p3, :cond_2c

    .line 8
    sget p3, Lc/a/a/a/l;->MaterialCheckBox_buttonTint:I

    .line 9
    invoke-static {p1, p2, p3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 10
    invoke-static {p0, p1}, Lb/h/n/c;->a(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    .line 11
    :cond_2c
    sget p1, Lc/a/a/a/l;->MaterialCheckBox_useMaterialThemeColors:I

    .line 12
    invoke-virtual {p2, p1, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/material/checkbox/MaterialCheckBox;->l:Z

    .line 13
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private getMaterialThemeColorsTintList()Landroid/content/res/ColorStateList;
    .registers 7

    .line 1
    iget-object v0, p0, Lcom/google/android/material/checkbox/MaterialCheckBox;->k:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_48

    .line 2
    sget-object v0, Lcom/google/android/material/checkbox/MaterialCheckBox;->n:[[I

    array-length v0, v0

    new-array v0, v0, [I

    .line 3
    sget v1, Lc/a/a/a/b;->colorControlActivated:I

    invoke-static {p0, v1}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v1

    .line 4
    sget v2, Lc/a/a/a/b;->colorSurface:I

    invoke-static {p0, v2}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v2

    .line 5
    sget v3, Lc/a/a/a/b;->colorOnSurface:I

    invoke-static {p0, v3}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result v3

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 6
    invoke-static {v2, v1, v5}, Lc/a/a/a/w/a;->a(IIF)I

    move-result v1

    aput v1, v0, v4

    const/4 v1, 0x1

    const v4, 0x3f0a3d71    # 0.54f

    .line 7
    invoke-static {v2, v3, v4}, Lc/a/a/a/w/a;->a(IIF)I

    move-result v4

    aput v4, v0, v1

    const/4 v1, 0x2

    const v4, 0x3ec28f5c    # 0.38f

    .line 8
    invoke-static {v2, v3, v4}, Lc/a/a/a/w/a;->a(IIF)I

    move-result v5

    aput v5, v0, v1

    const/4 v1, 0x3

    .line 9
    invoke-static {v2, v3, v4}, Lc/a/a/a/w/a;->a(IIF)I

    move-result v2

    aput v2, v0, v1

    .line 10
    new-instance v1, Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/google/android/material/checkbox/MaterialCheckBox;->n:[[I

    invoke-direct {v1, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    iput-object v1, p0, Lcom/google/android/material/checkbox/MaterialCheckBox;->k:Landroid/content/res/ColorStateList;

    .line 11
    :cond_48
    iget-object v0, p0, Lcom/google/android/material/checkbox/MaterialCheckBox;->k:Landroid/content/res/ColorStateList;

    return-object v0
.end method


# virtual methods
.method public onAttachedToWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/CheckBox;->onAttachedToWindow()V

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/checkbox/MaterialCheckBox;->l:Z

    if-eqz v0, :cond_11

    invoke-static {p0}, Lb/h/n/c;->b(Landroid/widget/CompoundButton;)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-nez v0, :cond_11

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/checkbox/MaterialCheckBox;->setUseMaterialThemeColors(Z)V

    :cond_11
    return-void
.end method

.method public setUseMaterialThemeColors(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/checkbox/MaterialCheckBox;->l:Z

    if-eqz p1, :cond_c

    .line 2
    invoke-direct {p0}, Lcom/google/android/material/checkbox/MaterialCheckBox;->getMaterialThemeColorsTintList()Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-static {p0, p1}, Lb/h/n/c;->a(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    goto :goto_10

    :cond_c
    const/4 p1, 0x0

    .line 3
    invoke-static {p0, p1}, Lb/h/n/c;->a(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V

    :goto_10
    return-void
.end method
