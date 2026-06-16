.class public Lb/b/q/m;
.super Ljava/lang/Object;
.source "AppCompatTextHelper.java"


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Lb/b/q/e0;

.field public c:Lb/b/q/e0;

.field public d:Lb/b/q/e0;

.field public e:Lb/b/q/e0;

.field public f:Lb/b/q/e0;

.field public g:Lb/b/q/e0;

.field public h:Lb/b/q/e0;

.field public final i:Lb/b/q/n;

.field public j:I

.field public k:I

.field public l:Landroid/graphics/Typeface;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/b/q/m;->j:I

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lb/b/q/m;->k:I

    .line 4
    iput-object p1, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    .line 5
    new-instance p1, Lb/b/q/n;

    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lb/b/q/n;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Lb/b/q/m;->i:Lb/b/q/n;

    return-void
.end method

.method public static a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;
    .registers 3

    .line 209
    invoke-virtual {p1, p0, p2}, Lb/b/q/f;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_11

    .line 210
    new-instance p1, Lb/b/q/e0;

    invoke-direct {p1}, Lb/b/q/e0;-><init>()V

    const/4 p2, 0x1

    .line 211
    iput-boolean p2, p1, Lb/b/q/e0;->d:Z

    .line 212
    iput-object p0, p1, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    return-object p1

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public a()V
    .registers 6

    .line 197
    iget-object v0, p0, Lb/b/q/m;->b:Lb/b/q/e0;

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_12

    iget-object v0, p0, Lb/b/q/m;->c:Lb/b/q/e0;

    if-nez v0, :cond_12

    iget-object v0, p0, Lb/b/q/m;->d:Lb/b/q/e0;

    if-nez v0, :cond_12

    iget-object v0, p0, Lb/b/q/m;->e:Lb/b/q/e0;

    if-eqz v0, :cond_36

    .line 198
    :cond_12
    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 199
    aget-object v3, v0, v2

    iget-object v4, p0, Lb/b/q/m;->b:Lb/b/q/e0;

    invoke-virtual {p0, v3, v4}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V

    const/4 v3, 0x1

    .line 200
    aget-object v3, v0, v3

    iget-object v4, p0, Lb/b/q/m;->c:Lb/b/q/e0;

    invoke-virtual {p0, v3, v4}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V

    .line 201
    aget-object v3, v0, v1

    iget-object v4, p0, Lb/b/q/m;->d:Lb/b/q/e0;

    invoke-virtual {p0, v3, v4}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V

    const/4 v3, 0x3

    .line 202
    aget-object v0, v0, v3

    iget-object v3, p0, Lb/b/q/m;->e:Lb/b/q/e0;

    invoke-virtual {p0, v0, v3}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V

    .line 203
    :cond_36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v0, v3, :cond_58

    .line 204
    iget-object v0, p0, Lb/b/q/m;->f:Lb/b/q/e0;

    if-nez v0, :cond_44

    iget-object v0, p0, Lb/b/q/m;->g:Lb/b/q/e0;

    if-eqz v0, :cond_58

    .line 205
    :cond_44
    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 206
    aget-object v2, v0, v2

    iget-object v3, p0, Lb/b/q/m;->f:Lb/b/q/e0;

    invoke-virtual {p0, v2, v3}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V

    .line 207
    aget-object v0, v0, v1

    iget-object v1, p0, Lb/b/q/m;->g:Lb/b/q/e0;

    invoke-virtual {p0, v0, v1}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V

    :cond_58
    return-void
.end method

.method public a(I)V
    .registers 3

    .line 218
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0, p1}, Lb/b/q/n;->b(I)V

    return-void
.end method

.method public a(IF)V
    .registers 4

    .line 215
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-nez v0, :cond_d

    .line 216
    invoke-virtual {p0}, Lb/b/q/m;->j()Z

    move-result v0

    if-nez v0, :cond_d

    .line 217
    invoke-virtual {p0, p1, p2}, Lb/b/q/m;->b(IF)V

    :cond_d
    return-void
.end method

.method public a(IIII)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 219
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/b/q/n;->a(IIII)V

    return-void
.end method

.method public a(Landroid/content/Context;I)V
    .registers 6

    .line 169
    sget-object v0, Lb/b/j;->TextAppearance:[I

    invoke-static {p1, p2, v0}, Lb/b/q/g0;->a(Landroid/content/Context;I[I)Lb/b/q/g0;

    move-result-object p2

    .line 170
    sget v0, Lb/b/j;->TextAppearance_textAllCaps:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    .line 171
    sget v0, Lb/b/j;->TextAppearance_textAllCaps:I

    invoke-virtual {p2, v0, v1}, Lb/b/q/g0;->a(IZ)Z

    move-result v0

    invoke-virtual {p0, v0}, Lb/b/q/m;->a(Z)V

    .line 172
    :cond_18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v0, v2, :cond_5d

    .line 173
    sget v0, Lb/b/j;->TextAppearance_android_textColor:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 174
    sget v0, Lb/b/j;->TextAppearance_android_textColor:I

    .line 175
    invoke-virtual {p2, v0}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 176
    iget-object v2, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 177
    :cond_33
    sget v0, Lb/b/j;->TextAppearance_android_textColorLink:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 178
    sget v0, Lb/b/j;->TextAppearance_android_textColorLink:I

    .line 179
    invoke-virtual {p2, v0}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_48

    .line 180
    iget-object v2, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    .line 181
    :cond_48
    sget v0, Lb/b/j;->TextAppearance_android_textColorHint:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 182
    sget v0, Lb/b/j;->TextAppearance_android_textColorHint:I

    .line 183
    invoke-virtual {p2, v0}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_5d

    .line 184
    iget-object v2, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    .line 185
    :cond_5d
    sget v0, Lb/b/j;->TextAppearance_android_textSize:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_74

    .line 186
    sget v0, Lb/b/j;->TextAppearance_android_textSize:I

    const/4 v2, -0x1

    invoke-virtual {p2, v0, v2}, Lb/b/q/g0;->c(II)I

    move-result v0

    if-nez v0, :cond_74

    .line 187
    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 188
    :cond_74
    invoke-virtual {p0, p1, p2}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/g0;)V

    .line 189
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p1, v0, :cond_92

    sget p1, Lb/b/j;->TextAppearance_fontVariationSettings:I

    .line 190
    invoke-virtual {p2, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_92

    .line 191
    sget p1, Lb/b/j;->TextAppearance_fontVariationSettings:I

    invoke-virtual {p2, p1}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_92

    .line 192
    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setFontVariationSettings(Ljava/lang/String;)Z

    .line 193
    :cond_92
    invoke-virtual {p2}, Lb/b/q/g0;->b()V

    .line 194
    iget-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    if-eqz p1, :cond_a0

    .line 195
    iget-object p2, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    iget v0, p0, Lb/b/q/m;->j:I

    invoke-virtual {p2, p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_a0
    return-void
.end method

.method public final a(Landroid/content/Context;Lb/b/q/g0;)V
    .registers 12

    .line 129
    sget v0, Lb/b/j;->TextAppearance_android_textStyle:I

    iget v1, p0, Lb/b/q/m;->j:I

    invoke-virtual {p2, v0, v1}, Lb/b/q/g0;->d(II)I

    move-result v0

    iput v0, p0, Lb/b/q/m;->j:I

    .line 130
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const/4 v2, 0x2

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-lt v0, v1, :cond_23

    .line 131
    sget v0, Lb/b/j;->TextAppearance_android_textFontWeight:I

    invoke-virtual {p2, v0, v3}, Lb/b/q/g0;->d(II)I

    move-result v0

    iput v0, p0, Lb/b/q/m;->k:I

    if-eq v0, v3, :cond_23

    .line 132
    iget v0, p0, Lb/b/q/m;->j:I

    and-int/2addr v0, v2

    or-int/2addr v0, v4

    iput v0, p0, Lb/b/q/m;->j:I

    .line 133
    :cond_23
    sget v0, Lb/b/j;->TextAppearance_android_fontFamily:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    const/4 v5, 0x1

    if-nez v0, :cond_5c

    sget v0, Lb/b/j;->TextAppearance_fontFamily:I

    .line 134
    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_35

    goto :goto_5c

    .line 135
    :cond_35
    sget p1, Lb/b/j;->TextAppearance_android_typeface:I

    invoke-virtual {p2, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_5b

    .line 136
    iput-boolean v4, p0, Lb/b/q/m;->m:Z

    .line 137
    sget p1, Lb/b/j;->TextAppearance_android_typeface:I

    invoke-virtual {p2, p1, v5}, Lb/b/q/g0;->d(II)I

    move-result p1

    if-eq p1, v5, :cond_57

    if-eq p1, v2, :cond_52

    const/4 p2, 0x3

    if-eq p1, p2, :cond_4d

    goto :goto_5b

    .line 138
    :cond_4d
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    goto :goto_5b

    .line 139
    :cond_52
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    goto :goto_5b

    .line 140
    :cond_57
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    :cond_5b
    :goto_5b
    return-void

    :cond_5c
    :goto_5c
    const/4 v0, 0x0

    .line 141
    iput-object v0, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    .line 142
    sget v0, Lb/b/j;->TextAppearance_fontFamily:I

    invoke-virtual {p2, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_6a

    .line 143
    sget v0, Lb/b/j;->TextAppearance_fontFamily:I

    goto :goto_6c

    .line 144
    :cond_6a
    sget v0, Lb/b/j;->TextAppearance_android_fontFamily:I

    .line 145
    :goto_6c
    iget v6, p0, Lb/b/q/m;->k:I

    .line 146
    iget v7, p0, Lb/b/q/m;->j:I

    .line 147
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    move-result p1

    if-nez p1, :cond_b4

    .line 148
    new-instance p1, Ljava/lang/ref/WeakReference;

    iget-object v8, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-direct {p1, v8}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 149
    new-instance v8, Lb/b/q/m$a;

    invoke-direct {v8, p0, v6, v7, p1}, Lb/b/q/m$a;-><init>(Lb/b/q/m;IILjava/lang/ref/WeakReference;)V

    .line 150
    :try_start_82
    iget p1, p0, Lb/b/q/m;->j:I

    invoke-virtual {p2, v0, p1, v8}, Lb/b/q/g0;->a(IILb/h/e/c/f$a;)Landroid/graphics/Typeface;

    move-result-object p1

    if-eqz p1, :cond_a9

    .line 151
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v1, :cond_a7

    iget v6, p0, Lb/b/q/m;->k:I

    if-eq v6, v3, :cond_a7

    .line 152
    invoke-static {p1, v4}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    iget v6, p0, Lb/b/q/m;->k:I

    iget v7, p0, Lb/b/q/m;->j:I

    and-int/2addr v7, v2

    if-eqz v7, :cond_9f

    const/4 v7, 0x1

    goto :goto_a0

    :cond_9f
    const/4 v7, 0x0

    .line 153
    :goto_a0
    invoke-static {p1, v6, v7}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    goto :goto_a9

    .line 154
    :cond_a7
    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    .line 155
    :cond_a9
    :goto_a9
    iget-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    if-nez p1, :cond_af

    const/4 p1, 0x1

    goto :goto_b0

    :cond_af
    const/4 p1, 0x0

    :goto_b0
    iput-boolean p1, p0, Lb/b/q/m;->m:Z
    :try_end_b2
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_82 .. :try_end_b2} :catch_b3
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_82 .. :try_end_b2} :catch_b3

    goto :goto_b4

    :catch_b3
    nop

    .line 156
    :cond_b4
    :goto_b4
    iget-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    if-nez p1, :cond_e1

    .line 157
    invoke-virtual {p2, v0}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_e1

    .line 158
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v1, :cond_d9

    iget p2, p0, Lb/b/q/m;->k:I

    if-eq p2, v3, :cond_d9

    .line 159
    invoke-static {p1, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    iget p2, p0, Lb/b/q/m;->k:I

    iget v0, p0, Lb/b/q/m;->j:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_d2

    const/4 v4, 0x1

    .line 160
    :cond_d2
    invoke-static {p1, p2, v4}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    goto :goto_e1

    .line 161
    :cond_d9
    iget p2, p0, Lb/b/q/m;->j:I

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    :cond_e1
    :goto_e1
    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 221
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 222
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    .line 223
    :cond_b
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_13

    const/4 p1, 0x1

    goto :goto_14

    :cond_13
    const/4 p1, 0x0

    .line 224
    :goto_14
    iput-boolean p1, v0, Lb/b/q/e0;->d:Z

    .line 225
    invoke-virtual {p0}, Lb/b/q/m;->l()V

    return-void
.end method

.method public a(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 226
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    if-nez v0, :cond_b

    .line 227
    new-instance v0, Lb/b/q/e0;

    invoke-direct {v0}, Lb/b/q/e0;-><init>()V

    iput-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    .line 228
    :cond_b
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    iput-object p1, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    if-eqz p1, :cond_13

    const/4 p1, 0x1

    goto :goto_14

    :cond_13
    const/4 p1, 0x0

    .line 229
    :goto_14
    iput-boolean p1, v0, Lb/b/q/e0;->c:Z

    .line 230
    invoke-virtual {p0}, Lb/b/q/m;->l()V

    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 13

    .line 231
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-lt v0, v1, :cond_2e

    if-nez p5, :cond_e

    if-eqz p6, :cond_2e

    .line 232
    :cond_e
    iget-object p1, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 233
    iget-object p3, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    if-eqz p5, :cond_19

    goto :goto_1b

    .line 234
    :cond_19
    aget-object p5, p1, v5

    :goto_1b
    if-eqz p2, :cond_1e

    goto :goto_20

    .line 235
    :cond_1e
    aget-object p2, p1, v3

    :goto_20
    if-eqz p6, :cond_23

    goto :goto_25

    .line 236
    :cond_23
    aget-object p6, p1, v4

    :goto_25
    if-eqz p4, :cond_28

    goto :goto_2a

    .line 237
    :cond_28
    aget-object p4, p1, v2

    .line 238
    :goto_2a
    invoke-virtual {p3, p5, p2, p6, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_7b

    :cond_2e
    if-nez p1, :cond_36

    if-nez p2, :cond_36

    if-nez p3, :cond_36

    if-eqz p4, :cond_7b

    .line 239
    :cond_36
    sget p5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p5, v1, :cond_5c

    .line 240
    iget-object p5, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {p5}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object p5

    .line 241
    aget-object p6, p5, v5

    if-nez p6, :cond_48

    aget-object p6, p5, v4

    if-eqz p6, :cond_5c

    .line 242
    :cond_48
    iget-object p1, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    aget-object p3, p5, v5

    if-eqz p2, :cond_4f

    goto :goto_51

    .line 243
    :cond_4f
    aget-object p2, p5, v3

    :goto_51
    aget-object p6, p5, v4

    if-eqz p4, :cond_56

    goto :goto_58

    .line 244
    :cond_56
    aget-object p4, p5, v2

    .line 245
    :goto_58
    invoke-virtual {p1, p3, p2, p6, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 246
    :cond_5c
    iget-object p5, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {p5}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object p5

    .line 247
    iget-object p6, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    if-eqz p1, :cond_67

    goto :goto_69

    .line 248
    :cond_67
    aget-object p1, p5, v5

    :goto_69
    if-eqz p2, :cond_6c

    goto :goto_6e

    .line 249
    :cond_6c
    aget-object p2, p5, v3

    :goto_6e
    if-eqz p3, :cond_71

    goto :goto_73

    .line 250
    :cond_71
    aget-object p3, p5, v4

    :goto_73
    if-eqz p4, :cond_76

    goto :goto_78

    .line 251
    :cond_76
    aget-object p4, p5, v2

    .line 252
    :goto_78
    invoke-virtual {p6, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_7b
    :goto_7b
    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;)V
    .registers 4

    if-eqz p1, :cond_d

    if-eqz p2, :cond_d

    .line 208
    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getDrawableState()[I

    move-result-object v0

    invoke-static {p1, p2, v0}, Lb/b/q/f;->a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V

    :cond_d
    return-void
.end method

.method public a(Landroid/util/AttributeSet;I)V
    .registers 20
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move/from16 v9, p2

    .line 1
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v10

    .line 2
    invoke-static {}, Lb/b/q/f;->b()Lb/b/q/f;

    move-result-object v11

    .line 3
    sget-object v0, Lb/b/j;->AppCompatTextHelper:[I

    const/4 v12, 0x0

    invoke-static {v10, v8, v0, v9, v12}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object v13

    .line 4
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lb/b/j;->AppCompatTextHelper:[I

    .line 5
    invoke-virtual {v13}, Lb/b/q/g0;->a()Landroid/content/res/TypedArray;

    move-result-object v4

    const/4 v6, 0x0

    move-object/from16 v3, p1

    move/from16 v5, p2

    .line 6
    invoke-static/range {v0 .. v6}, Lb/h/m/y;->a(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 7
    sget v0, Lb/b/j;->AppCompatTextHelper_android_textAppearance:I

    const/4 v14, -0x1

    invoke-virtual {v13, v0, v14}, Lb/b/q/g0;->g(II)I

    move-result v0

    .line 8
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableLeft:I

    invoke-virtual {v13, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 9
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableLeft:I

    .line 10
    invoke-virtual {v13, v1, v12}, Lb/b/q/g0;->g(II)I

    move-result v1

    .line 11
    invoke-static {v10, v11, v1}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;

    move-result-object v1

    iput-object v1, v7, Lb/b/q/m;->b:Lb/b/q/e0;

    .line 12
    :cond_46
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableTop:I

    invoke-virtual {v13, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 13
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableTop:I

    .line 14
    invoke-virtual {v13, v1, v12}, Lb/b/q/g0;->g(II)I

    move-result v1

    .line 15
    invoke-static {v10, v11, v1}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;

    move-result-object v1

    iput-object v1, v7, Lb/b/q/m;->c:Lb/b/q/e0;

    .line 16
    :cond_5a
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableRight:I

    invoke-virtual {v13, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_6e

    .line 17
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableRight:I

    .line 18
    invoke-virtual {v13, v1, v12}, Lb/b/q/g0;->g(II)I

    move-result v1

    .line 19
    invoke-static {v10, v11, v1}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;

    move-result-object v1

    iput-object v1, v7, Lb/b/q/m;->d:Lb/b/q/e0;

    .line 20
    :cond_6e
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableBottom:I

    invoke-virtual {v13, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 21
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableBottom:I

    .line 22
    invoke-virtual {v13, v1, v12}, Lb/b/q/g0;->g(II)I

    move-result v1

    .line 23
    invoke-static {v10, v11, v1}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;

    move-result-object v1

    iput-object v1, v7, Lb/b/q/m;->e:Lb/b/q/e0;

    .line 24
    :cond_82
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_b0

    .line 25
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableStart:I

    invoke-virtual {v13, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_9c

    .line 26
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableStart:I

    .line 27
    invoke-virtual {v13, v1, v12}, Lb/b/q/g0;->g(II)I

    move-result v1

    .line 28
    invoke-static {v10, v11, v1}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;

    move-result-object v1

    iput-object v1, v7, Lb/b/q/m;->f:Lb/b/q/e0;

    .line 29
    :cond_9c
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableEnd:I

    invoke-virtual {v13, v1}, Lb/b/q/g0;->g(I)Z

    move-result v1

    if-eqz v1, :cond_b0

    .line 30
    sget v1, Lb/b/j;->AppCompatTextHelper_android_drawableEnd:I

    .line 31
    invoke-virtual {v13, v1, v12}, Lb/b/q/g0;->g(II)I

    move-result v1

    .line 32
    invoke-static {v10, v11, v1}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/f;I)Lb/b/q/e0;

    move-result-object v1

    iput-object v1, v7, Lb/b/q/m;->g:Lb/b/q/e0;

    .line 33
    :cond_b0
    invoke-virtual {v13}, Lb/b/q/g0;->b()V

    .line 34
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    .line 35
    invoke-virtual {v1}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v1

    instance-of v1, v1, Landroid/text/method/PasswordTransformationMethod;

    const/16 v2, 0x1a

    const/16 v4, 0x17

    if-eq v0, v14, :cond_13e

    .line 36
    sget-object v5, Lb/b/j;->TextAppearance:[I

    invoke-static {v10, v0, v5}, Lb/b/q/g0;->a(Landroid/content/Context;I[I)Lb/b/q/g0;

    move-result-object v0

    if-nez v1, :cond_d9

    .line 37
    sget v5, Lb/b/j;->TextAppearance_textAllCaps:I

    invoke-virtual {v0, v5}, Lb/b/q/g0;->g(I)Z

    move-result v5

    if-eqz v5, :cond_d9

    .line 38
    sget v5, Lb/b/j;->TextAppearance_textAllCaps:I

    invoke-virtual {v0, v5, v12}, Lb/b/q/g0;->a(IZ)Z

    move-result v5

    const/4 v6, 0x1

    goto :goto_db

    :cond_d9
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 39
    :goto_db
    invoke-virtual {v7, v10, v0}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/g0;)V

    .line 40
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v15, v4, :cond_113

    .line 41
    sget v15, Lb/b/j;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v15}, Lb/b/q/g0;->g(I)Z

    move-result v15

    if-eqz v15, :cond_f1

    .line 42
    sget v15, Lb/b/j;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v15}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v15

    goto :goto_f2

    :cond_f1
    const/4 v15, 0x0

    .line 43
    :goto_f2
    sget v3, Lb/b/j;->TextAppearance_android_textColorHint:I

    invoke-virtual {v0, v3}, Lb/b/q/g0;->g(I)Z

    move-result v3

    if-eqz v3, :cond_101

    .line 44
    sget v3, Lb/b/j;->TextAppearance_android_textColorHint:I

    invoke-virtual {v0, v3}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    goto :goto_102

    :cond_101
    const/4 v3, 0x0

    .line 45
    :goto_102
    sget v13, Lb/b/j;->TextAppearance_android_textColorLink:I

    invoke-virtual {v0, v13}, Lb/b/q/g0;->g(I)Z

    move-result v13

    if-eqz v13, :cond_111

    .line 46
    sget v13, Lb/b/j;->TextAppearance_android_textColorLink:I

    invoke-virtual {v0, v13}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    goto :goto_116

    :cond_111
    const/4 v13, 0x0

    goto :goto_116

    :cond_113
    const/4 v3, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    .line 47
    :goto_116
    sget v14, Lb/b/j;->TextAppearance_textLocale:I

    invoke-virtual {v0, v14}, Lb/b/q/g0;->g(I)Z

    move-result v14

    if-eqz v14, :cond_125

    .line 48
    sget v14, Lb/b/j;->TextAppearance_textLocale:I

    invoke-virtual {v0, v14}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_126

    :cond_125
    const/4 v14, 0x0

    .line 49
    :goto_126
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v2, :cond_139

    sget v4, Lb/b/j;->TextAppearance_fontVariationSettings:I

    .line 50
    invoke-virtual {v0, v4}, Lb/b/q/g0;->g(I)Z

    move-result v4

    if-eqz v4, :cond_139

    .line 51
    sget v4, Lb/b/j;->TextAppearance_fontVariationSettings:I

    invoke-virtual {v0, v4}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_13a

    :cond_139
    const/4 v4, 0x0

    .line 52
    :goto_13a
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    goto :goto_145

    :cond_13e
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    .line 53
    :goto_145
    sget-object v0, Lb/b/j;->TextAppearance:[I

    invoke-static {v10, v8, v0, v9, v12}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object v0

    if-nez v1, :cond_15e

    .line 54
    sget v2, Lb/b/j;->TextAppearance_textAllCaps:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_15e

    .line 55
    sget v2, Lb/b/j;->TextAppearance_textAllCaps:I

    invoke-virtual {v0, v2, v12}, Lb/b/q/g0;->a(IZ)Z

    move-result v5

    const/16 v16, 0x1

    goto :goto_160

    :cond_15e
    move/from16 v16, v6

    .line 56
    :goto_160
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-ge v2, v6, :cond_190

    .line 57
    sget v2, Lb/b/j;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_174

    .line 58
    sget v2, Lb/b/j;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v15

    .line 59
    :cond_174
    sget v2, Lb/b/j;->TextAppearance_android_textColorHint:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_182

    .line 60
    sget v2, Lb/b/j;->TextAppearance_android_textColorHint:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 61
    :cond_182
    sget v2, Lb/b/j;->TextAppearance_android_textColorLink:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_190

    .line 62
    sget v2, Lb/b/j;->TextAppearance_android_textColorLink:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    .line 63
    :cond_190
    sget v2, Lb/b/j;->TextAppearance_textLocale:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_19e

    .line 64
    sget v2, Lb/b/j;->TextAppearance_textLocale:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v14

    .line 65
    :cond_19e
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1a

    if-lt v2, v6, :cond_1b2

    sget v2, Lb/b/j;->TextAppearance_fontVariationSettings:I

    .line 66
    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_1b2

    .line 67
    sget v2, Lb/b/j;->TextAppearance_fontVariationSettings:I

    invoke-virtual {v0, v2}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v4

    .line 68
    :cond_1b2
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1c

    if-lt v2, v6, :cond_1cf

    sget v2, Lb/b/j;->TextAppearance_android_textSize:I

    .line 69
    invoke-virtual {v0, v2}, Lb/b/q/g0;->g(I)Z

    move-result v2

    if-eqz v2, :cond_1cf

    .line 70
    sget v2, Lb/b/j;->TextAppearance_android_textSize:I

    const/4 v6, -0x1

    invoke-virtual {v0, v2, v6}, Lb/b/q/g0;->c(II)I

    move-result v2

    if-nez v2, :cond_1cf

    .line 71
    iget-object v2, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    const/4 v6, 0x0

    invoke-virtual {v2, v12, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 72
    :cond_1cf
    invoke-virtual {v7, v10, v0}, Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/g0;)V

    .line 73
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    if-eqz v15, :cond_1dc

    .line 74
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0, v15}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1dc
    if-eqz v3, :cond_1e3

    .line 75
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1e3
    if-eqz v13, :cond_1ea

    .line 76
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1ea
    if-nez v1, :cond_1f1

    if-eqz v16, :cond_1f1

    .line 77
    invoke-virtual {v7, v5}, Lb/b/q/m;->a(Z)V

    .line 78
    :cond_1f1
    iget-object v0, v7, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    if-eqz v0, :cond_207

    .line 79
    iget v1, v7, Lb/b/q/m;->k:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_202

    .line 80
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    iget v2, v7, Lb/b/q/m;->j:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_207

    .line 81
    :cond_202
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_207
    :goto_207
    if-eqz v4, :cond_20e

    .line 82
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFontVariationSettings(Ljava/lang/String;)Z

    :cond_20e
    if-eqz v14, :cond_237

    .line 83
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_220

    .line 84
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v14}, Landroid/os/LocaleList;->forLanguageTags(Ljava/lang/String;)Landroid/os/LocaleList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextLocales(Landroid/os/LocaleList;)V

    goto :goto_237

    :cond_220
    const/16 v1, 0x15

    if-lt v0, v1, :cond_237

    const/16 v0, 0x2c

    .line 85
    invoke-virtual {v14, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    invoke-virtual {v14, v12, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 86
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextLocale(Ljava/util/Locale;)V

    .line 87
    :cond_237
    :goto_237
    iget-object v0, v7, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0, v8, v9}, Lb/b/q/n;->a(Landroid/util/AttributeSet;I)V

    .line 88
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_27b

    .line 89
    iget-object v0, v7, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->g()I

    move-result v0

    if-eqz v0, :cond_27b

    .line 90
    iget-object v0, v7, Lb/b/q/m;->i:Lb/b/q/n;

    .line 91
    invoke-virtual {v0}, Lb/b/q/n;->f()[I

    move-result-object v0

    .line 92
    array-length v1, v0

    if-lez v1, :cond_27b

    .line 93
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getAutoSizeStepGranularity()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_276

    .line 94
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    iget-object v1, v7, Lb/b/q/m;->i:Lb/b/q/n;

    .line 95
    invoke-virtual {v1}, Lb/b/q/n;->d()I

    move-result v1

    iget-object v2, v7, Lb/b/q/m;->i:Lb/b/q/n;

    .line 96
    invoke-virtual {v2}, Lb/b/q/n;->c()I

    move-result v2

    iget-object v3, v7, Lb/b/q/m;->i:Lb/b/q/n;

    .line 97
    invoke-virtual {v3}, Lb/b/q/n;->e()I

    move-result v3

    .line 98
    invoke-virtual {v0, v1, v2, v3, v12}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    goto :goto_27b

    .line 99
    :cond_276
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v1, v0, v12}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithPresetSizes([II)V

    .line 100
    :cond_27b
    :goto_27b
    sget-object v0, Lb/b/j;->AppCompatTextView:[I

    invoke-static {v10, v8, v0}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[I)Lb/b/q/g0;

    move-result-object v8

    .line 101
    sget v0, Lb/b/j;->AppCompatTextView_drawableLeftCompat:I

    const/4 v1, -0x1

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    if-eq v0, v1, :cond_290

    .line 102
    invoke-virtual {v11, v10, v0}, Lb/b/q/f;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v2, v0

    goto :goto_291

    :cond_290
    const/4 v2, 0x0

    .line 103
    :goto_291
    sget v0, Lb/b/j;->AppCompatTextView_drawableTopCompat:I

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    if-eq v0, v1, :cond_29f

    .line 104
    invoke-virtual {v11, v10, v0}, Lb/b/q/f;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v3, v0

    goto :goto_2a0

    :cond_29f
    const/4 v3, 0x0

    .line 105
    :goto_2a0
    sget v0, Lb/b/j;->AppCompatTextView_drawableRightCompat:I

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    if-eq v0, v1, :cond_2ae

    .line 106
    invoke-virtual {v11, v10, v0}, Lb/b/q/f;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v4, v0

    goto :goto_2af

    :cond_2ae
    const/4 v4, 0x0

    .line 107
    :goto_2af
    sget v0, Lb/b/j;->AppCompatTextView_drawableBottomCompat:I

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    if-eq v0, v1, :cond_2bd

    .line 108
    invoke-virtual {v11, v10, v0}, Lb/b/q/f;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v5, v0

    goto :goto_2be

    :cond_2bd
    const/4 v5, 0x0

    .line 109
    :goto_2be
    sget v0, Lb/b/j;->AppCompatTextView_drawableStartCompat:I

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    if-eq v0, v1, :cond_2cc

    .line 110
    invoke-virtual {v11, v10, v0}, Lb/b/q/f;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v6, v0

    goto :goto_2cd

    :cond_2cc
    const/4 v6, 0x0

    .line 111
    :goto_2cd
    sget v0, Lb/b/j;->AppCompatTextView_drawableEndCompat:I

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    if-eq v0, v1, :cond_2db

    .line 112
    invoke-virtual {v11, v10, v0}, Lb/b/q/f;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v9, v0

    goto :goto_2dc

    :cond_2db
    const/4 v9, 0x0

    :goto_2dc
    move-object/from16 v0, p0

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v9

    .line 113
    invoke-virtual/range {v0 .. v6}, Lb/b/q/m;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 114
    sget v0, Lb/b/j;->AppCompatTextView_drawableTint:I

    invoke-virtual {v8, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_2fa

    .line 115
    sget v0, Lb/b/j;->AppCompatTextView_drawableTint:I

    invoke-virtual {v8, v0}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 116
    iget-object v1, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v1, v0}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 117
    :cond_2fa
    sget v0, Lb/b/j;->AppCompatTextView_drawableTintMode:I

    invoke-virtual {v8, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_314

    .line 118
    sget v0, Lb/b/j;->AppCompatTextView_drawableTintMode:I

    const/4 v1, -0x1

    .line 119
    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->d(II)I

    move-result v0

    const/4 v2, 0x0

    .line 120
    invoke-static {v0, v2}, Lb/b/q/q;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    .line 121
    iget-object v2, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v2, v0}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_315

    :cond_314
    const/4 v1, -0x1

    .line 122
    :goto_315
    sget v0, Lb/b/j;->AppCompatTextView_firstBaselineToTopHeight:I

    invoke-virtual {v8, v0, v1}, Lb/b/q/g0;->c(II)I

    move-result v0

    .line 123
    sget v2, Lb/b/j;->AppCompatTextView_lastBaselineToBottomHeight:I

    invoke-virtual {v8, v2, v1}, Lb/b/q/g0;->c(II)I

    move-result v2

    .line 124
    sget v3, Lb/b/j;->AppCompatTextView_lineHeight:I

    invoke-virtual {v8, v3, v1}, Lb/b/q/g0;->c(II)I

    move-result v3

    .line 125
    invoke-virtual {v8}, Lb/b/q/g0;->b()V

    if-eq v0, v1, :cond_331

    .line 126
    iget-object v4, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v4, v0}, Lb/h/n/i;->a(Landroid/widget/TextView;I)V

    :cond_331
    if-eq v2, v1, :cond_338

    .line 127
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v0, v2}, Lb/h/n/i;->b(Landroid/widget/TextView;I)V

    :cond_338
    if-eq v3, v1, :cond_33f

    .line 128
    iget-object v0, v7, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-static {v0, v3}, Lb/h/n/i;->c(Landroid/widget/TextView;I)V

    :cond_33f
    return-void
.end method

.method public a(Landroid/widget/TextView;Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)V
    .registers 6

    .line 253
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_f

    if-eqz p2, :cond_f

    .line 254
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p3, p1}, Lb/h/m/i0/a;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    :cond_f
    return-void
.end method

.method public a(Ljava/lang/ref/WeakReference;Landroid/graphics/Typeface;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;",
            "Landroid/graphics/Typeface;",
            ")V"
        }
    .end annotation

    .line 162
    iget-boolean v0, p0, Lb/b/q/m;->m:Z

    if-eqz v0, :cond_24

    .line 163
    iput-object p2, p0, Lb/b/q/m;->l:Landroid/graphics/Typeface;

    .line 164
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    if-eqz p1, :cond_24

    .line 165
    invoke-static {p1}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 166
    iget v0, p0, Lb/b/q/m;->j:I

    .line 167
    new-instance v1, Lb/b/q/m$b;

    invoke-direct {v1, p0, p1, p2, v0}, Lb/b/q/m$b;-><init>(Lb/b/q/m;Landroid/widget/TextView;Landroid/graphics/Typeface;I)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    goto :goto_24

    .line 168
    :cond_1f
    iget v0, p0, Lb/b/q/m;->j:I

    invoke-virtual {p1, p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_24
    :goto_24
    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 196
    iget-object v0, p0, Lb/b/q/m;->a:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    return-void
.end method

.method public a(ZIIII)V
    .registers 6

    .line 213
    sget-boolean p1, Lb/h/n/b;->a:Z

    if-nez p1, :cond_7

    .line 214
    invoke-virtual {p0}, Lb/b/q/m;->b()V

    :cond_7
    return-void
.end method

.method public a([II)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 220
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0, p1, p2}, Lb/b/q/n;->a([II)V

    return-void
.end method

.method public b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->a()V

    return-void
.end method

.method public final b(IF)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0, p1, p2}, Lb/b/q/n;->a(IF)V

    return-void
.end method

.method public c()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->c()I

    move-result v0

    return v0
.end method

.method public d()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->d()I

    move-result v0

    return v0
.end method

.method public e()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->e()I

    move-result v0

    return v0
.end method

.method public f()[I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->f()[I

    move-result-object v0

    return-object v0
.end method

.method public g()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->g()I

    move-result v0

    return v0
.end method

.method public h()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public i()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    return-object v0
.end method

.method public j()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->i:Lb/b/q/n;

    invoke-virtual {v0}, Lb/b/q/n;->h()Z

    move-result v0

    return v0
.end method

.method public k()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lb/b/q/m;->a()V

    return-void
.end method

.method public final l()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/m;->h:Lb/b/q/e0;

    iput-object v0, p0, Lb/b/q/m;->b:Lb/b/q/e0;

    .line 2
    iput-object v0, p0, Lb/b/q/m;->c:Lb/b/q/e0;

    .line 3
    iput-object v0, p0, Lb/b/q/m;->d:Lb/b/q/e0;

    .line 4
    iput-object v0, p0, Lb/b/q/m;->e:Lb/b/q/e0;

    .line 5
    iput-object v0, p0, Lb/b/q/m;->f:Lb/b/q/e0;

    .line 6
    iput-object v0, p0, Lb/b/q/m;->g:Lb/b/q/e0;

    return-void
.end method
