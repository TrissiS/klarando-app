.class public final Lc/a/a/a/d0/i;
.super Ljava/lang/Object;
.source "StaticLayoutBuilderCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/d0/i$a;
    }
.end annotation


# static fields
.field public static final n:I

.field public static o:Z

.field public static p:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "Landroid/text/StaticLayout;",
            ">;"
        }
    .end annotation
.end field

.field public static q:Ljava/lang/Object;


# instance fields
.field public a:Ljava/lang/CharSequence;

.field public final b:Landroid/text/TextPaint;

.field public final c:I

.field public d:I

.field public e:I

.field public f:Landroid/text/Layout$Alignment;

.field public g:I

.field public h:F

.field public i:F

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Landroid/text/TextUtils$TruncateAt;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    sput v0, Lc/a/a/a/d0/i;->n:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/d0/i;->a:Ljava/lang/CharSequence;

    .line 3
    iput-object p2, p0, Lc/a/a/a/d0/i;->b:Landroid/text/TextPaint;

    .line 4
    iput p3, p0, Lc/a/a/a/d0/i;->c:I

    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lc/a/a/a/d0/i;->d:I

    .line 6
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    iput p1, p0, Lc/a/a/a/d0/i;->e:I

    .line 7
    sget-object p1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    iput-object p1, p0, Lc/a/a/a/d0/i;->f:Landroid/text/Layout$Alignment;

    const p1, 0x7fffffff

    .line 8
    iput p1, p0, Lc/a/a/a/d0/i;->g:I

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lc/a/a/a/d0/i;->h:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    iput p1, p0, Lc/a/a/a/d0/i;->i:F

    .line 11
    sget p1, Lc/a/a/a/d0/i;->n:I

    iput p1, p0, Lc/a/a/a/d0/i;->j:I

    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lc/a/a/a/d0/i;->k:Z

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lc/a/a/a/d0/i;->m:Landroid/text/TextUtils$TruncateAt;

    return-void
.end method

.method public static a(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Lc/a/a/a/d0/i;
    .registers 4

    .line 1
    new-instance v0, Lc/a/a/a/d0/i;

    invoke-direct {v0, p0, p1, p2}, Lc/a/a/a/d0/i;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)V

    return-object v0
.end method


# virtual methods
.method public a()Landroid/text/StaticLayout;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/a/a/d0/i$a;
        }
    .end annotation

    .line 8
    iget-object v0, p0, Lc/a/a/a/d0/i;->a:Ljava/lang/CharSequence;

    if-nez v0, :cond_8

    const-string v0, ""

    .line 9
    iput-object v0, p0, Lc/a/a/a/d0/i;->a:Ljava/lang/CharSequence;

    .line 10
    :cond_8
    iget v0, p0, Lc/a/a/a/d0/i;->c:I

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 11
    iget-object v2, p0, Lc/a/a/a/d0/i;->a:Ljava/lang/CharSequence;

    .line 12
    iget v3, p0, Lc/a/a/a/d0/i;->g:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1f

    .line 13
    iget-object v3, p0, Lc/a/a/a/d0/i;->b:Landroid/text/TextPaint;

    int-to-float v5, v0

    iget-object v6, p0, Lc/a/a/a/d0/i;->m:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v2, v3, v5, v6}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 14
    :cond_1f
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    iget v5, p0, Lc/a/a/a/d0/i;->e:I

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Lc/a/a/a/d0/i;->e:I

    .line 15
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x17

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    if-lt v3, v5, :cond_8d

    .line 16
    iget-boolean v1, p0, Lc/a/a/a/d0/i;->l:Z

    if-eqz v1, :cond_40

    iget v1, p0, Lc/a/a/a/d0/i;->g:I

    if-ne v1, v4, :cond_40

    .line 17
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    iput-object v1, p0, Lc/a/a/a/d0/i;->f:Landroid/text/Layout$Alignment;

    .line 18
    :cond_40
    iget v1, p0, Lc/a/a/a/d0/i;->d:I

    iget v3, p0, Lc/a/a/a/d0/i;->e:I

    iget-object v5, p0, Lc/a/a/a/d0/i;->b:Landroid/text/TextPaint;

    .line 19
    invoke-static {v2, v1, v3, v5, v0}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 20
    iget-object v1, p0, Lc/a/a/a/d0/i;->f:Landroid/text/Layout$Alignment;

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 21
    iget-boolean v1, p0, Lc/a/a/a/d0/i;->k:Z

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    .line 22
    iget-boolean v1, p0, Lc/a/a/a/d0/i;->l:Z

    if-eqz v1, :cond_5b

    sget-object v1, Landroid/text/TextDirectionHeuristics;->RTL:Landroid/text/TextDirectionHeuristic;

    goto :goto_5d

    :cond_5b
    sget-object v1, Landroid/text/TextDirectionHeuristics;->LTR:Landroid/text/TextDirectionHeuristic;

    .line 23
    :goto_5d
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setTextDirection(Landroid/text/TextDirectionHeuristic;)Landroid/text/StaticLayout$Builder;

    .line 24
    iget-object v1, p0, Lc/a/a/a/d0/i;->m:Landroid/text/TextUtils$TruncateAt;

    if-eqz v1, :cond_67

    .line 25
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    .line 26
    :cond_67
    iget v1, p0, Lc/a/a/a/d0/i;->g:I

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setMaxLines(I)Landroid/text/StaticLayout$Builder;

    .line 27
    iget v1, p0, Lc/a/a/a/d0/i;->h:F

    cmpl-float v1, v1, v7

    if-nez v1, :cond_78

    iget v1, p0, Lc/a/a/a/d0/i;->i:F

    cmpl-float v1, v1, v6

    if-eqz v1, :cond_7f

    .line 28
    :cond_78
    iget v1, p0, Lc/a/a/a/d0/i;->h:F

    iget v2, p0, Lc/a/a/a/d0/i;->i:F

    invoke-virtual {v0, v1, v2}, Landroid/text/StaticLayout$Builder;->setLineSpacing(FF)Landroid/text/StaticLayout$Builder;

    .line 29
    :cond_7f
    iget v1, p0, Lc/a/a/a/d0/i;->g:I

    if-le v1, v4, :cond_88

    .line 30
    iget v1, p0, Lc/a/a/a/d0/i;->j:I

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setHyphenationFrequency(I)Landroid/text/StaticLayout$Builder;

    .line 31
    :cond_88
    invoke-virtual {v0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object v0

    return-object v0

    .line 32
    :cond_8d
    invoke-virtual {p0}, Lc/a/a/a/d0/i;->b()V

    .line 33
    :try_start_90
    sget-object v3, Lc/a/a/a/d0/i;->p:Ljava/lang/reflect/Constructor;

    invoke-static {v3}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v3, Ljava/lang/reflect/Constructor;

    const/16 v5, 0xd

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v2, v5, v1

    iget v1, p0, Lc/a/a/a/d0/i;->d:I

    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v4

    const/4 v1, 0x2

    iget v2, p0, Lc/a/a/a/d0/i;->e:I

    .line 35
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lc/a/a/a/d0/i;->b:Landroid/text/TextPaint;

    aput-object v2, v5, v1

    const/4 v1, 0x4

    .line 36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lc/a/a/a/d0/i;->f:Landroid/text/Layout$Alignment;

    aput-object v2, v5, v1

    const/4 v1, 0x6

    sget-object v2, Lc/a/a/a/d0/i;->q:Ljava/lang/Object;

    .line 37
    invoke-static {v2}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    aput-object v2, v5, v1

    const/4 v1, 0x7

    .line 38
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v5, v1

    const/16 v1, 0x8

    .line 39
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v5, v1

    const/16 v1, 0x9

    iget-boolean v2, p0, Lc/a/a/a/d0/i;->k:Z

    .line 40
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v5, v1

    const/16 v1, 0xa

    const/4 v2, 0x0

    aput-object v2, v5, v1

    const/16 v1, 0xb

    .line 41
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v1

    const/16 v0, 0xc

    iget v1, p0, Lc/a/a/a/d0/i;->g:I

    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v0

    .line 43
    invoke-virtual {v3, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/StaticLayout;
    :try_end_fd
    .catch Ljava/lang/Exception; {:try_start_90 .. :try_end_fd} :catch_fe

    return-object v0

    :catch_fe
    move-exception v0

    .line 44
    new-instance v1, Lc/a/a/a/d0/i$a;

    invoke-direct {v1, v0}, Lc/a/a/a/d0/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public a(FF)Lc/a/a/a/d0/i;
    .registers 3

    .line 4
    iput p1, p0, Lc/a/a/a/d0/i;->h:F

    .line 5
    iput p2, p0, Lc/a/a/a/d0/i;->i:F

    return-object p0
.end method

.method public a(I)Lc/a/a/a/d0/i;
    .registers 2

    .line 6
    iput p1, p0, Lc/a/a/a/d0/i;->j:I

    return-object p0
.end method

.method public a(Landroid/text/Layout$Alignment;)Lc/a/a/a/d0/i;
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/a/a/d0/i;->f:Landroid/text/Layout$Alignment;

    return-object p0
.end method

.method public a(Landroid/text/TextUtils$TruncateAt;)Lc/a/a/a/d0/i;
    .registers 2

    .line 7
    iput-object p1, p0, Lc/a/a/a/d0/i;->m:Landroid/text/TextUtils$TruncateAt;

    return-object p0
.end method

.method public a(Z)Lc/a/a/a/d0/i;
    .registers 2

    .line 3
    iput-boolean p1, p0, Lc/a/a/a/d0/i;->k:Z

    return-object p0
.end method

.method public b(I)Lc/a/a/a/d0/i;
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/d0/i;->g:I

    return-object p0
.end method

.method public b(Z)Lc/a/a/a/d0/i;
    .registers 2

    .line 17
    iput-boolean p1, p0, Lc/a/a/a/d0/i;->l:Z

    return-object p0
.end method

.method public final b()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/a/a/d0/i$a;
        }
    .end annotation

    .line 2
    sget-boolean v0, Lc/a/a/a/d0/i;->o:Z

    if-eqz v0, :cond_5

    return-void

    .line 3
    :cond_5
    :try_start_5
    iget-boolean v0, p0, Lc/a/a/a/d0/i;->l:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_13

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v0, v3, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    .line 4
    :goto_14
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-lt v3, v4, :cond_26

    .line 5
    const-class v3, Landroid/text/TextDirectionHeuristic;

    if-eqz v0, :cond_21

    .line 6
    sget-object v0, Landroid/text/TextDirectionHeuristics;->RTL:Landroid/text/TextDirectionHeuristic;

    goto :goto_23

    :cond_21
    sget-object v0, Landroid/text/TextDirectionHeuristics;->LTR:Landroid/text/TextDirectionHeuristic;

    :goto_23
    sput-object v0, Lc/a/a/a/d0/i;->q:Ljava/lang/Object;

    goto :goto_4c

    .line 7
    :cond_26
    const-class v0, Lc/a/a/a/d0/i;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 8
    iget-boolean v3, p0, Lc/a/a/a/d0/i;->l:Z

    if-eqz v3, :cond_33

    const-string v3, "RTL"

    goto :goto_35

    :cond_33
    const-string v3, "LTR"

    :goto_35
    const-string v4, "android.text.TextDirectionHeuristic"

    .line 9
    invoke-virtual {v0, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "android.text.TextDirectionHeuristics"

    .line 10
    invoke-virtual {v0, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sput-object v0, Lc/a/a/a/d0/i;->q:Ljava/lang/Object;

    move-object v3, v4

    :goto_4c
    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/Class;

    .line 12
    const-class v4, Ljava/lang/CharSequence;

    aput-object v4, v0, v1

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v2

    const/4 v1, 0x2

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v0, v1

    const/4 v1, 0x3

    const-class v4, Landroid/text/TextPaint;

    aput-object v4, v0, v1

    const/4 v1, 0x4

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v0, v1

    const/4 v1, 0x5

    const-class v4, Landroid/text/Layout$Alignment;

    aput-object v4, v0, v1

    const/4 v1, 0x6

    aput-object v3, v0, v1

    const/4 v1, 0x7

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v1

    const/16 v1, 0x8

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v1

    const/16 v1, 0x9

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v1

    const/16 v1, 0xa

    const-class v3, Landroid/text/TextUtils$TruncateAt;

    aput-object v3, v0, v1

    const/16 v1, 0xb

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v1

    const/16 v1, 0xc

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v1

    .line 13
    const-class v1, Landroid/text/StaticLayout;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    sput-object v0, Lc/a/a/a/d0/i;->p:Ljava/lang/reflect/Constructor;

    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 15
    sput-boolean v2, Lc/a/a/a/d0/i;->o:Z
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_9f} :catch_a0

    return-void

    :catch_a0
    move-exception v0

    .line 16
    new-instance v1, Lc/a/a/a/d0/i$a;

    invoke-direct {v1, v0}, Lc/a/a/a/d0/i$a;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
