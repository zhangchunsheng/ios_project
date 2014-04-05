#include "HelloWorldScene.h"

USING_NS_CC;

CCScene* HelloWorld::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    HelloWorld *layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();


	CCSprite* pSprite = CCSprite::create("HelloWorld.png");
	pSprite->setPosition( ccp(visibleSize.width/2, visibleSize.height/2) );
	//this->addChild(pSprite);
    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    CCMenuItemImage *pCloseItem = CCMenuItemImage::create(
                                        "CloseNormal.png",
                                        "CloseSelected.png",
                                        this,
                                        menu_selector(HelloWorld::menuCloseCallback));
    
	pCloseItem->setPosition(ccp(origin.x + visibleSize.width - pCloseItem->getContentSize().width/2 ,
                                origin.y + pCloseItem->getContentSize().height/2));

    // create menu, it's an autorelease object
    CCMenu* pMenu = CCMenu::create(pCloseItem, NULL);
    pMenu->setPosition(CCPointZero);
    this->addChild(pMenu, 1);

    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    
    CCLabelTTF* pLabel = CCLabelTTF::create("Hello World", "Arial", 24);
    
    // position the label on the center of the screen
    pLabel->setPosition(ccp(origin.x + visibleSize.width/2,
                            origin.y + visibleSize.height - pLabel->getContentSize().height));

    // add the label as a child to this layer
    this->addChild(pLabel, 1);

	IsTestPrimitivesOrDrawNode=false;

	DrawNodeTest();

    return true;
}


void HelloWorld::menuCloseCallback(CCObject* pSender)
{
	CCDirector::sharedDirector()->end();
}

void HelloWorld::draw()
{
	if (IsTestPrimitivesOrDrawNode)
	{

		CHECK_GL_ERROR_DEBUG();

		// draw a simple line
		// The default state is:
		// Line Width: 1
		// color: 255,255,255,255 (white, non-transparent)
		// Anti-Aliased
		//	glEnable(GL_LINE_SMOOTH);
		ccDrawLine( ccp(100,100), ccp(200,200) );

		CHECK_GL_ERROR_DEBUG();

		// line: color, width, aliased
		// glLineWidth > 1 and GL_LINE_SMOOTH are not compatible
		// GL_SMOOTH_LINE_WIDTH_RANGE = (1,1) on iPhone
		//	glDisable(GL_LINE_SMOOTH);
		glLineWidth( 5.0f );
		ccDrawColor4B(255,0,0,255);
		ccDrawLine( ccp(100,200), ccp(200,100) );

		CHECK_GL_ERROR_DEBUG();

		// TIP:
		// If you are going to use always the same color or width, you don't
		// need to call it before every draw
		//
		// Remember: OpenGL is a state-machine.

		// draw big point in the center
		ccPointSize(64);
		ccDrawColor4B(0,0,255,128);
		ccDrawPoint( ccp(150,150) );

		CHECK_GL_ERROR_DEBUG();

		// draw 4 small points
		CCPoint points[] = { ccp(60,60), ccp(70,70), ccp(60,70), ccp(70,60) };
		ccPointSize(4);
		ccDrawColor4B(0,255,255,255);
		ccDrawPoints( points, 4);

		CHECK_GL_ERROR_DEBUG();

		// draw a green circle with 10 segments
		glLineWidth(16);
		ccDrawColor4B(0, 255, 0, 255);
		ccDrawCircle( ccp(150,150), 100, 0, 10, false);

		CHECK_GL_ERROR_DEBUG();

		// draw a green circle with 50 segments with line to center
		glLineWidth(2);
		ccDrawColor4B(0, 255, 255, 255);
		ccDrawCircle( ccp(150,150), 50, CC_DEGREES_TO_RADIANS(90), 50, true);

		CHECK_GL_ERROR_DEBUG();

		// open yellow poly
		ccDrawColor4B(255, 255, 0, 255);
		glLineWidth(10);
		CCPoint vertices[] = { ccp(0,0), ccp(50,50), ccp(100,50), ccp(100,100), ccp(50,100) };
		ccDrawPoly( vertices, 5, false);

		CHECK_GL_ERROR_DEBUG();

		// filled poly
		glLineWidth(1);
		CCPoint filledVertices[] = { ccp(0,120), ccp(50,120), ccp(50,170), ccp(25,200), ccp(0,170) };
		ccDrawSolidPoly(filledVertices, 5, ccc4f(0.5f, 0.5f, 1, 1 ) );


		// closed purble poly
		ccDrawColor4B(255, 0, 255, 255);
		glLineWidth(2);
		CCPoint vertices2[] = { ccp(30,130), ccp(30,230), ccp(50,200) };
		ccDrawPoly( vertices2, 3, true);

		CHECK_GL_ERROR_DEBUG();

		// draw quad bezier path
		ccDrawQuadBezier(ccp(100,200), ccp(150,150), ccp(200,200), 50);

		CHECK_GL_ERROR_DEBUG();

		// draw cubic bezier path
		ccDrawCubicBezier(ccp(150,150), ccp(180,200), ccp(210,100),ccp(150,150),100);

		CHECK_GL_ERROR_DEBUG();

		//draw a solid polygon
		CCPoint vertices3[] = {ccp(60,160), ccp(70,190), ccp(100,190), ccp(90,160)};
		ccDrawSolidPoly( vertices3, 4, ccc4f(1,1,0,1) );

		// restore original values
		glLineWidth(1);
		ccDrawColor4B(255,255,255,255);
		ccPointSize(1);

		CHECK_GL_ERROR_DEBUG();

	}
}

void HelloWorld::DrawNodeTest()
{
	if(!IsTestPrimitivesOrDrawNode)
	{

	CCSize s = CCDirector::sharedDirector()->getWinSize();

	CCDrawNode *draw = CCDrawNode::create();
	addChild(draw, 10);

	// Draw 10 circles
	for( int i=0; i < 10; i++)
	{
		draw->drawDot(ccp(s.width/2, s.height/2), 10*(10-i), ccc4f(CCRANDOM_0_1(), CCRANDOM_0_1(), CCRANDOM_0_1(), 1));
	}

	// Draw polygons
	CCPoint points[] = { CCPoint(s.height/4,0), CCPoint(s.width,s.height/5), CCPoint(s.width/3*2,s.height) };
	draw->drawPolygon(points, sizeof(points)/sizeof(points[0]), ccc4f(1,0,0,0.5), 4, ccc4f(0,0,1,1));

	// star poly (triggers buggs)
	{
		const float o=80;
		const float w=20;
		const float h=50;
		CCPoint star[] = {
			CCPoint(o+w,o-h), CCPoint(o+w*2, o),						// lower spike
			CCPoint(o + w*2 + h, o+w ), CCPoint(o + w*2, o+w*2),		// right spike
			//				{o +w, o+w*2+h}, {o,o+w*2},					// top spike
			//				{o -h, o+w}, {o,o},							// left spike
		};

		draw->drawPolygon(star, sizeof(star)/sizeof(star[0]), ccc4f(1,0,0,0.5), 1, ccc4f(0,0,1,1));
	}

	// star poly (doesn't trigger bug... order is important un tesselation is supported.
	{
		const float o=180;
		const float w=20;
		const float h=50;
		CCPoint star[] = {
			CCPoint(o,o), CCPoint(o+w,o-h), CCPoint(o+w*2, o),		// lower spike
			CCPoint(o + w*2 + h, o+w ), CCPoint(o + w*2, o+w*2),	// right spike
			CCPoint(o +w, o+w*2+h), CCPoint(o,o+w*2),				// top spike
			CCPoint(o -h, o+w),                                     // left spike
		};

		draw->drawPolygon(star, sizeof(star)/sizeof(star[0]), ccc4f(1,0,0,0.5), 1, ccc4f(0,0,1,1));
	}


	// Draw segment
	draw->drawSegment(ccp(20,s.height), ccp(20,s.height/2), 10, ccc4f(0, 1, 0, 1));

	draw->drawSegment(ccp(10,s.height/2), ccp(s.width/2, s.height/2), 40, ccc4f(1, 0, 1, 0.5));

	}
}