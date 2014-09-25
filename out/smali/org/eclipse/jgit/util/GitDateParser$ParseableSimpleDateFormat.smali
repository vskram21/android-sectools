.class final enum Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
.super Ljava/lang/Enum;
.source "GitDateParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/GitDateParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ParseableSimpleDateFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum DEFAULT:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum ISO:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum LOCAL:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum RFC:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum SHORT:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum SHORT_WITH_DOTS:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum SHORT_WITH_DOTS_REVERSE:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

.field public static final enum SHORT_WITH_SLASH:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;


# instance fields
.field formatStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 119
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "ISO"

    const-string v2, "yyyy-MM-dd HH:mm:ss Z"

    invoke-direct {v0, v1, v4, v2}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->ISO:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 120
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "RFC"

    const-string v2, "EEE, dd MMM yyyy HH:mm:ss Z"

    invoke-direct {v0, v1, v5, v2}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->RFC:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 121
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "SHORT"

    const-string v2, "yyyy-MM-dd"

    invoke-direct {v0, v1, v6, v2}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 122
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "SHORT_WITH_DOTS_REVERSE"

    const-string v2, "dd.MM.yyyy"

    invoke-direct {v0, v1, v7, v2}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT_WITH_DOTS_REVERSE:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 123
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "SHORT_WITH_DOTS"

    const-string v2, "yyyy.MM.dd"

    invoke-direct {v0, v1, v8, v2}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT_WITH_DOTS:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 124
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "SHORT_WITH_SLASH"

    const/4 v2, 0x5

    const-string v3, "MM/dd/yyyy"

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT_WITH_SLASH:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 125
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "DEFAULT"

    const/4 v2, 0x6

    const-string v3, "EEE MMM dd HH:mm:ss yyyy Z"

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->DEFAULT:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 126
    new-instance v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    const-string v1, "LOCAL"

    const/4 v2, 0x7

    const-string v3, "EEE MMM dd HH:mm:ss yyyy"

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->LOCAL:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    .line 118
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    sget-object v1, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->ISO:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->RFC:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT_WITH_DOTS_REVERSE:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v1, v0, v7

    sget-object v1, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT_WITH_DOTS:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->SHORT_WITH_SLASH:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->DEFAULT:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->LOCAL:Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->$VALUES:[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter "formatStr"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 131
    iput-object p3, p0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->formatStr:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    .locals 1
    .parameter "name"

    .prologue
    .line 118
    const-class v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;
    .locals 1

    .prologue
    .line 118
    sget-object v0, Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->$VALUES:[Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/util/GitDateParser$ParseableSimpleDateFormat;

    return-object v0
.end method
