.class public Lb/h/k/e$f;
.super Lb/h/k/e$d;
.source "TextDirectionHeuristicsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/k/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# static fields
.field public static final b:Lb/h/k/e$f;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/h/k/e$f;

    invoke-direct {v0}, Lb/h/k/e$f;-><init>()V

    sput-object v0, Lb/h/k/e$f;->b:Lb/h/k/e$f;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lb/h/k/e$d;-><init>(Lb/h/k/e$c;)V

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lb/h/k/f;->b(Ljava/util/Locale;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c

    goto :goto_d

    :cond_c
    const/4 v1, 0x0

    :goto_d
    return v1
.end method
