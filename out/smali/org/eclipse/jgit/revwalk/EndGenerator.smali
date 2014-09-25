.class Lorg/eclipse/jgit/revwalk/EndGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "EndGenerator.java"


# static fields
.field static final INSTANCE:Lorg/eclipse/jgit/revwalk/EndGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    new-instance v0, Lorg/eclipse/jgit/revwalk/EndGenerator;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/EndGenerator;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/revwalk/EndGenerator;->INSTANCE:Lorg/eclipse/jgit/revwalk/EndGenerator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method
