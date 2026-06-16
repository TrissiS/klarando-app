.class public Lf/a/a$b;
.super Lf/a/a$c;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lf/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final b:Ljava/util/regex/Pattern;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const-string v0, "(\\$\\d+)+$"

    .line 1
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lf/a/a$b;->b:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lf/a/a$c;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 4

    .line 8
    invoke-super {p0}, Lf/a/a$c;->a()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    .line 9
    :cond_7
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 10
    array-length v1, v0

    const/4 v2, 0x5

    if-le v1, v2, :cond_1b

    .line 11
    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lf/a/a$b;->a(Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 12
    :cond_1b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Synthetic stacktrace didn\'t have enough elements: are you using proguard?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .registers 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object p1

    .line 2
    sget-object v0, Lf/a/a$b;->b:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_16

    const-string p1, ""

    .line 4
    invoke-virtual {v0, p1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_16
    const/16 v0, 0x2e

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x17

    if-le v0, v1, :cond_36

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v0, v2, :cond_31

    goto :goto_36

    :cond_31
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_36
    :goto_36
    return-object p1
.end method

.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 9

    .line 13
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p4

    const/4 v0, 0x7

    const/16 v1, 0xfa0

    if-ge p4, v1, :cond_13

    if-ne p1, v0, :cond_f

    .line 14
    invoke-static {p2, p3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12

    .line 15
    :cond_f
    invoke-static {p1, p2, p3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    :goto_12
    return-void

    :cond_13
    const/4 p4, 0x0

    .line 16
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    :goto_18
    if-ge p4, v1, :cond_3f

    const/16 v2, 0xa

    .line 17
    invoke-virtual {p3, v2, p4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_24

    goto :goto_25

    :cond_24
    move v2, v1

    :goto_25
    add-int/lit16 v3, p4, 0xfa0

    .line 18
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 19
    invoke-virtual {p3, p4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p4

    if-ne p1, v0, :cond_35

    .line 20
    invoke-static {p2, p4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_38

    .line 21
    :cond_35
    invoke-static {p1, p2, p4}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    :goto_38
    if-lt v3, v2, :cond_3d

    add-int/lit8 p4, v3, 0x1

    goto :goto_18

    :cond_3d
    move p4, v3

    goto :goto_25

    :cond_3f
    return-void
.end method
