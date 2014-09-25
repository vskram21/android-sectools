.class public final enum Lorg/eclipse/jgit/util/GitDateFormatter$Format;
.super Ljava/lang/Enum;
.source "GitDateFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/GitDateFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Format"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/util/GitDateFormatter$Format;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum DEFAULT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum ISO:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum LOCAL:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum LOCALE:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum LOCALELOCAL:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum RAW:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum RELATIVE:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum RFC:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

.field public static final enum SHORT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 75
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "DEFAULT"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->DEFAULT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 80
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "RELATIVE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->RELATIVE:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 85
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "LOCAL"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->LOCAL:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 90
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "ISO"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->ISO:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 95
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "RFC"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->RFC:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 100
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "SHORT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->SHORT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 105
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "RAW"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->RAW:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 110
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "LOCALE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->LOCALE:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 115
    new-instance v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    const-string v1, "LOCALELOCAL"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/util/GitDateFormatter$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->LOCALELOCAL:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    .line 70
    const/16 v0, 0x9

    new-array v0, v0, [Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->DEFAULT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->RELATIVE:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->LOCAL:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->ISO:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->RFC:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->SHORT:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->RAW:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->LOCALE:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->LOCALELOCAL:Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->$VALUES:[Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/util/GitDateFormatter$Format;
    .locals 1
    .parameter "name"

    .prologue
    .line 70
    const-class v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/util/GitDateFormatter$Format;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lorg/eclipse/jgit/util/GitDateFormatter$Format;->$VALUES:[Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/util/GitDateFormatter$Format;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/util/GitDateFormatter$Format;

    return-object v0
.end method
