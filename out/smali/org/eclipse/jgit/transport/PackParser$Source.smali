.class public final enum Lorg/eclipse/jgit/transport/PackParser$Source;
.super Ljava/lang/Enum;
.source "PackParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PackParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Source"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/transport/PackParser$Source;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/transport/PackParser$Source;

.field public static final enum DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

.field public static final enum INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 104
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$Source;

    const-string v1, "INPUT"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/PackParser$Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    .line 107
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$Source;

    const-string v1, "DATABASE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/PackParser$Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    .line 102
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/transport/PackParser$Source;

    sget-object v1, Lorg/eclipse/jgit/transport/PackParser$Source;->INPUT:Lorg/eclipse/jgit/transport/PackParser$Source;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/transport/PackParser$Source;->DATABASE:Lorg/eclipse/jgit/transport/PackParser$Source;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/transport/PackParser$Source;->$VALUES:[Lorg/eclipse/jgit/transport/PackParser$Source;

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
    .line 102
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/PackParser$Source;
    .locals 1
    .parameter "name"

    .prologue
    .line 102
    const-class v0, Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/PackParser$Source;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/transport/PackParser$Source;
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lorg/eclipse/jgit/transport/PackParser$Source;->$VALUES:[Lorg/eclipse/jgit/transport/PackParser$Source;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/transport/PackParser$Source;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/PackParser$Source;

    return-object v0
.end method
