.class public final Lc/a/a/a/d0/t$b;
.super Ljava/lang/Object;
.source "ViewUtils.java"

# interfaces
.implements Lc/a/a/a/d0/t$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/d0/t;->a(Landroid/view/View;Landroid/util/AttributeSet;IILc/a/a/a/d0/t$e;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Lc/a/a/a/d0/t$e;


# direct methods
.method public constructor <init>(ZZZLc/a/a/a/d0/t$e;)V
    .registers 5

    .line 1
    iput-boolean p1, p0, Lc/a/a/a/d0/t$b;->a:Z

    iput-boolean p2, p0, Lc/a/a/a/d0/t$b;->b:Z

    iput-boolean p3, p0, Lc/a/a/a/d0/t$b;->c:Z

    iput-object p4, p0, Lc/a/a/a/d0/t$b;->d:Lc/a/a/a/d0/t$e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/g0;Lc/a/a/a/d0/t$f;)Lb/h/m/g0;
    .registers 7

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/d0/t$b;->a:Z

    if-eqz v0, :cond_d

    .line 2
    iget v0, p3, Lc/a/a/a/d0/t$f;->d:I

    invoke-virtual {p2}, Lb/h/m/g0;->e()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p3, Lc/a/a/a/d0/t$f;->d:I

    .line 3
    :cond_d
    invoke-static {p1}, Lc/a/a/a/d0/t;->e(Landroid/view/View;)Z

    move-result v0

    .line 4
    iget-boolean v1, p0, Lc/a/a/a/d0/t$b;->b:Z

    if-eqz v1, :cond_2a

    if-eqz v0, :cond_21

    .line 5
    iget v1, p3, Lc/a/a/a/d0/t$f;->c:I

    invoke-virtual {p2}, Lb/h/m/g0;->f()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p3, Lc/a/a/a/d0/t$f;->c:I

    goto :goto_2a

    .line 6
    :cond_21
    iget v1, p3, Lc/a/a/a/d0/t$f;->a:I

    invoke-virtual {p2}, Lb/h/m/g0;->f()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p3, Lc/a/a/a/d0/t$f;->a:I

    .line 7
    :cond_2a
    :goto_2a
    iget-boolean v1, p0, Lc/a/a/a/d0/t$b;->c:Z

    if-eqz v1, :cond_43

    if-eqz v0, :cond_3a

    .line 8
    iget v0, p3, Lc/a/a/a/d0/t$f;->a:I

    invoke-virtual {p2}, Lb/h/m/g0;->g()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p3, Lc/a/a/a/d0/t$f;->a:I

    goto :goto_43

    .line 9
    :cond_3a
    iget v0, p3, Lc/a/a/a/d0/t$f;->c:I

    invoke-virtual {p2}, Lb/h/m/g0;->g()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p3, Lc/a/a/a/d0/t$f;->c:I

    .line 10
    :cond_43
    :goto_43
    invoke-virtual {p3, p1}, Lc/a/a/a/d0/t$f;->a(Landroid/view/View;)V

    .line 11
    iget-object v0, p0, Lc/a/a/a/d0/t$b;->d:Lc/a/a/a/d0/t$e;

    if-eqz v0, :cond_4e

    .line 12
    invoke-interface {v0, p1, p2, p3}, Lc/a/a/a/d0/t$e;->a(Landroid/view/View;Lb/h/m/g0;Lc/a/a/a/d0/t$f;)Lb/h/m/g0;

    move-result-object p2

    :cond_4e
    return-object p2
.end method
