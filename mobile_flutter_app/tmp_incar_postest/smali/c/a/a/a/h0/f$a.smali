.class public final Lc/a/a/a/h0/f$a;
.super Lb/k/a/c;
.source "DeterminateDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/h0/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/k/a/c<",
        "Lc/a/a/a/h0/f;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/k/a/c;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/h0/f;)F
    .registers 3

    .line 3
    invoke-static {p1}, Lc/a/a/a/h0/f;->a(Lc/a/a/a/h0/f;)F

    move-result p1

    const v0, 0x461c4000    # 10000.0f

    mul-float p1, p1, v0

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;)F
    .registers 2

    .line 1
    check-cast p1, Lc/a/a/a/h0/f;

    invoke-virtual {p0, p1}, Lc/a/a/a/h0/f$a;->a(Lc/a/a/a/h0/f;)F

    move-result p1

    return p1
.end method

.method public a(Lc/a/a/a/h0/f;F)V
    .registers 4

    const v0, 0x461c4000    # 10000.0f

    div-float/2addr p2, v0

    .line 4
    invoke-static {p1, p2}, Lc/a/a/a/h0/f;->a(Lc/a/a/a/h0/f;F)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;F)V
    .registers 3

    .line 2
    check-cast p1, Lc/a/a/a/h0/f;

    invoke-virtual {p0, p1, p2}, Lc/a/a/a/h0/f$a;->a(Lc/a/a/a/h0/f;F)V

    return-void
.end method
