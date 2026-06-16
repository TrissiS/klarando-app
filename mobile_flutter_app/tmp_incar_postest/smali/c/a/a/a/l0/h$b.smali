.class public Lc/a/a/a/l0/h$b;
.super Ljava/lang/Object;
.source "MaterialShapeDrawable.java"

# interfaces
.implements Lc/a/a/a/l0/m$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/l0/h;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:F


# direct methods
.method public constructor <init>(Lc/a/a/a/l0/h;F)V
    .registers 3

    .line 1
    iput p2, p0, Lc/a/a/a/l0/h$b;->a:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/l0/c;)Lc/a/a/a/l0/c;
    .registers 4

    .line 1
    instance-of v0, p1, Lc/a/a/a/l0/k;

    if-eqz v0, :cond_5

    goto :goto_d

    :cond_5
    new-instance v0, Lc/a/a/a/l0/b;

    iget v1, p0, Lc/a/a/a/l0/h$b;->a:F

    invoke-direct {v0, v1, p1}, Lc/a/a/a/l0/b;-><init>(FLc/a/a/a/l0/c;)V

    move-object p1, v0

    :goto_d
    return-object p1
.end method
