.class public final Lc/a/a/a/l0/n$c;
.super Ljava/lang/Object;
.source "ShapeAppearancePathProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/l0/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:Lc/a/a/a/l0/m;

.field public final b:Landroid/graphics/Path;

.field public final c:Landroid/graphics/RectF;

.field public final d:Lc/a/a/a/l0/n$b;

.field public final e:F


# direct methods
.method public constructor <init>(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Lc/a/a/a/l0/n$b;Landroid/graphics/Path;)V
    .registers 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p4, p0, Lc/a/a/a/l0/n$c;->d:Lc/a/a/a/l0/n$b;

    .line 3
    iput-object p1, p0, Lc/a/a/a/l0/n$c;->a:Lc/a/a/a/l0/m;

    .line 4
    iput p2, p0, Lc/a/a/a/l0/n$c;->e:F

    .line 5
    iput-object p3, p0, Lc/a/a/a/l0/n$c;->c:Landroid/graphics/RectF;

    .line 6
    iput-object p5, p0, Lc/a/a/a/l0/n$c;->b:Landroid/graphics/Path;

    return-void
.end method
