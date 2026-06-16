.class public final Lc/a/a/a/d0/t$c;
.super Ljava/lang/Object;
.source "ViewUtils.java"

# interfaces
.implements Lb/h/m/s;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/d0/t;->a(Landroid/view/View;Lc/a/a/a/d0/t$e;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/d0/t$e;

.field public final synthetic b:Lc/a/a/a/d0/t$f;


# direct methods
.method public constructor <init>(Lc/a/a/a/d0/t$e;Lc/a/a/a/d0/t$f;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/t$c;->a:Lc/a/a/a/d0/t$e;

    iput-object p2, p0, Lc/a/a/a/d0/t$c;->b:Lc/a/a/a/d0/t$f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/t$c;->a:Lc/a/a/a/d0/t$e;

    new-instance v1, Lc/a/a/a/d0/t$f;

    iget-object v2, p0, Lc/a/a/a/d0/t$c;->b:Lc/a/a/a/d0/t$f;

    invoke-direct {v1, v2}, Lc/a/a/a/d0/t$f;-><init>(Lc/a/a/a/d0/t$f;)V

    invoke-interface {v0, p1, p2, v1}, Lc/a/a/a/d0/t$e;->a(Landroid/view/View;Lb/h/m/g0;Lc/a/a/a/d0/t$f;)Lb/h/m/g0;

    move-result-object p1

    return-object p1
.end method
