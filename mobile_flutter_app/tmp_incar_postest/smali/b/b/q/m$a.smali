.class public Lb/b/q/m$a;
.super Lb/h/e/c/f$a;
.source "AppCompatTextHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/b/q/m;->a(Landroid/content/Context;Lb/b/q/g0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/ref/WeakReference;

.field public final synthetic d:Lb/b/q/m;


# direct methods
.method public constructor <init>(Lb/b/q/m;IILjava/lang/ref/WeakReference;)V
    .registers 5

    .line 1
    iput-object p1, p0, Lb/b/q/m$a;->d:Lb/b/q/m;

    iput p2, p0, Lb/b/q/m$a;->a:I

    iput p3, p0, Lb/b/q/m$a;->b:I

    iput-object p4, p0, Lb/b/q/m$a;->c:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Lb/h/e/c/f$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 2

    return-void
.end method

.method public a(Landroid/graphics/Typeface;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_18

    .line 2
    iget v0, p0, Lb/b/q/m$a;->a:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_18

    .line 3
    iget v1, p0, Lb/b/q/m$a;->b:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_13

    const/4 v1, 0x1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    :goto_14
    invoke-static {p1, v0, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p1

    .line 4
    :cond_18
    iget-object v0, p0, Lb/b/q/m$a;->d:Lb/b/q/m;

    iget-object v1, p0, Lb/b/q/m$a;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0, v1, p1}, Lb/b/q/m;->a(Ljava/lang/ref/WeakReference;Landroid/graphics/Typeface;)V

    return-void
.end method
