.class public Lb/h/k/e$b;
.super Ljava/lang/Object;
.source "TextDirectionHeuristicsCompat.java"

# interfaces
.implements Lb/h/k/e$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/k/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final a:Lb/h/k/e$b;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/h/k/e$b;

    invoke-direct {v0}, Lb/h/k/e$b;-><init>()V

    sput-object v0, Lb/h/k/e$b;->a:Lb/h/k/e$b;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;II)I
    .registers 6

    add-int/2addr p3, p2

    const/4 v0, 0x2

    const/4 v1, 0x2

    :goto_3
    if-ge p2, p3, :cond_16

    if-ne v1, v0, :cond_16

    .line 1
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->getDirectionality(C)B

    move-result v1

    invoke-static {v1}, Lb/h/k/e;->b(I)I

    move-result v1

    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    :cond_16
    return v1
.end method
