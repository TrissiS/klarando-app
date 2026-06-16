.class public abstract Lb/f/a/b/c;
.super Ljava/lang/Object;
.source "Key.java"


# static fields
.field public static e:I = -0x1


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/c/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Lb/f/a/b/c;->e:I

    iput v0, p0, Lb/f/a/b/c;->a:I

    .line 3
    iput v0, p0, Lb/f/a/b/c;->b:I

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end method

.method public abstract a(Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract a(Ljava/util/HashSet;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public a(Ljava/lang/String;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/a/b/c;->c:Ljava/lang/String;

    if-eqz v0, :cond_c

    if-nez p1, :cond_7

    goto :goto_c

    .line 2
    :cond_7
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_c
    :goto_c
    const/4 p1, 0x0

    return p1
.end method

.method public b(Ljava/util/HashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
